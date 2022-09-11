//
//  HomeViewModel.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/9/22.
//

import Factory
import Foundation

extension HomeView {
    @MainActor
    class ViewModel: ObservableObject {
        @Injected(Container.bookService) var bookService:BookServiceProtocol
        
        @Published var noteSearchText = ""
        @Published var isShowingAddBook = false
        @Published var activeBooks:[Book] = []
        @Published var wishlistBooks:[Book] = []
        @Published var archivedBooks:[Book] = []
        
        
        func loadBooks() {
            Task {
                do {
                    (active: activeBooks,
                     wishlist: wishlistBooks,
                     archived: archivedBooks) = try await bookService.loadAllBooks()
                } catch let error {
                    print("Error loading books: \(error)")
                }
            }
        }
    }
}
