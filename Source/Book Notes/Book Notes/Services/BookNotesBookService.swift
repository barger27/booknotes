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
    @Injected(Container.localStorageDAO) var localStorageDAO:LocalStorageDAOProtocol
    
    init() { }
    
    init(bookSearchDAO: BookSearchDAOProtocol) {
        self.bookSearchDAO = bookSearchDAO
    }
    
    func saveBook(book: Book) async throws {
        var editableBook = book
        localStorageDAO.saveBook(book: &editableBook)
    }
    
    func searchBook(searchString: String) async throws -> [Book] {
        if searchString.isEmpty {
            return []
        }
        
        do {
            let bookSearchResult = try await bookSearchDAO.searchBooks(search: searchString)
            let books = bookSearchResult.items.map { bookDTO in
                Book(id: bookDTO.id,
                     title: bookDTO.volumeInfo?.title ?? "",
                     subtitle: bookDTO.volumeInfo?.subtitle,
                     description: bookDTO.volumeInfo?.description ?? "",
                     authors: bookDTO.volumeInfo?.authors ?? [],
                     publishedDate: parseDate(dateString: bookDTO.volumeInfo?.publishedDate),
                     pageCount: bookDTO.volumeInfo?.pageCount,
                     bookCoverURL: parseURL(url: bookDTO.volumeInfo?.imageLinks?.smallThumbnail),
                     bookCoverThumbnail: parseURL(url: bookDTO.volumeInfo?.imageLinks?.smallThumbnail))
            }
            
            return books
        } catch let error {
            print("An error occurred while retrieving book results: " + error.localizedDescription)
        }
        
        return []
    }
    
    private func parseDate(dateString:String?) -> Date? {
        guard let dateValue = dateString, !dateValue.isEmpty else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.date(from: dateValue)
    }
    
    private func parseURL(url: String?) -> URL? {
        guard var imageURL = url else {
            return nil
        }
        
        imageURL = imageURL.replacingOccurrences(of: "http:", with: "https:")
        
        return URL(string: imageURL)
    }
}
