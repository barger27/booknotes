//
//  AddBookViewModel.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//
import Combine
import Factory
import Foundation

extension AddBookView {
    
    class ViewModel: ObservableObject {
        // Services
        @Injected(Container.bookService) private var bookService
        
        @Published var bookSearch:String = ""
        @Published var searchResults:[Book] = []
        
        private var subscriptions = Set<AnyCancellable>()
        
        
        init() {
            $bookSearch
                .debounce(for: .milliseconds(900), scheduler: RunLoop.main)
                .sink(receiveValue: { [weak self] text in
                    self?.performSearch(search: text)
                })
                .store(in: &subscriptions)
        }
        
        convenience init(bookService:BookServiceProtocol) {
            self.init()
            self.bookService = bookService
        }
        
        
        private func performSearch(search:String) {
            Task {
                do {
                    let bookResults = try await bookService.searchBook(searchString: search)
                    await MainActor.run(body: {
                        searchResults = bookResults
                    })
                }
                catch let error {
                    searchResults = []
                    print("Error loading search results", error)
                }
            }
        }
    }
}
