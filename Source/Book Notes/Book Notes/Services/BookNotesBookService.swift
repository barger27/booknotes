//
//  BookNotesBookService.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import Factory
import Foundation

class BookNotesBookService : BookServiceProtocol {
    @Injected(Container.bookSearchDAO) var bookSearchDAO:BookSearchDAOProtocol
    
    init() { }
    
    init(bookSearchDAO: BookSearchDAOProtocol) {
        self.bookSearchDAO = bookSearchDAO
    }
    
    func searchBook(searchString: String) async throws -> [Book] {
        if searchString.isEmpty {
            return []
        }
        
        do {
            let bookSearchResult = try await bookSearchDAO.searchBooks(search: searchString)
            return []
        } catch let error {
            print("An error occurred while retrieving book results: " + error.localizedDescription)
        }
        
        return []
    }
}
