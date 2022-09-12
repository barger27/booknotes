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
        @Published var selectedBook:Book? = nil
        @Published var isBookDetailsPresented = false
        
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
        
        
        init(bookList:[Book]) {
            searchResults = bookList
        }
        
        
        func onBookSelected(book: Book) {
            selectedBook = book
            isBookDetailsPresented = true
        }
        
        
        func deselectBook() {
            selectedBook = nil
            isBookDetailsPresented = false
        }
        
        @MainActor
        func addSelectedBookToReadNow() async -> Book? {
            guard var book = selectedBook else { return nil }
            book.status = .readList
            
            do {
                try await bookService.saveBook(book: book)
            } catch let error {
                print("Unable to save book")
                print(error)
            }
            
            deselectBook()
            return book
        }
        
        @MainActor
        func addSelectedBookToWishlist() async -> Book? {
            guard var book = selectedBook else { return nil }
            book.status = .wishlist
            
            do {
                try await bookService.saveBook(book: book)
            } catch let error {
                print("Unable to save book")
                print(error)
            }
            
            deselectBook()
            return book
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
