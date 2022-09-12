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
    
    init(bookSearchDAO: BookSearchDAOProtocol, localStorageDAO:LocalStorageDAOProtocol) {
        self.bookSearchDAO = bookSearchDAO
        self.localStorageDAO = localStorageDAO
    }
    
    func loadAllBooks() async throws -> (active: [Book], wishlist: [Book], archived: [Book]) {
        let allBooks = try localStorageDAO.readAllBooks()
        
        return (active: allBooks.filter { $0.status == .readList },
                wishlist: allBooks.filter { $0.status == .wishlist },
                archived: allBooks.filter { $0.status == .archived })
    }
    
    func saveBook(book: Book) async throws {
        var editableBook = book
        try localStorageDAO.saveBook(book: &editableBook)
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
                     averageRating: bookDTO.volumeInfo?.averageRating,
                     ratingResponses: bookDTO.volumeInfo?.ratingsCount,
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
        guard var dateValue = dateString, !dateValue.isEmpty else {
            return nil
        }
        
        if dateValue.count == 4 {
            dateValue = dateValue + "-01-01"
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
