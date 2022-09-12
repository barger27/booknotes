//
//  BookNotesBookServiceTest.swift
//  Book NotesTests
//
//  Created by Ryan Barger on 9/11/22.
//
@testable import Book_Notes
import XCTest

class BookNotesBookServiceTest: XCTestCase {
    private var bookService:BookNotesBookService!
    private var bookSearchDAO:MockBookSearchDAO!
    private var localStorageDAO:MockLocalStorageDAO!
    
    override func setUpWithError() throws {
        bookSearchDAO = MockBookSearchDAO()
        localStorageDAO = MockLocalStorageDAO()
        bookService = BookNotesBookService(bookSearchDAO: bookSearchDAO,
                                           localStorageDAO: localStorageDAO)
    }

    
    func test_loadAllBooks_booksAreInProperCategory() async throws {
        // Assemble
        // Act
        let (active, wishlist, archived) = try await bookService.loadAllBooks()
        
        // Assert
        XCTAssertEqual(1, active.count)
        XCTAssertEqual(3, wishlist.count)
        XCTAssertEqual(1, archived.count)
    }
    
    
    func test_saveBook_makesCallToLocalStorageDOA() async throws {
        // Assemble
        let book = MockBookService.defaultBooks[2]
        
        // Act
        try await bookService.saveBook(book: book)
        
        // Assert
        XCTAssertEqual(1, localStorageDAO.saveBookCount)
    }
    
    
    func test_searchBook_callsBookSearchDAO() async throws {
        // Assemble
        
        // Act
        let _ = try await bookService.searchBook(searchString: "test")
        
        // Assert
        XCTAssertEqual(1, bookSearchDAO.searchBooksCount)
    }
    
    
    func test_searchBook_parsesFullResultProperly() async throws {
        // Assemble
        
        // Act
        let results = try await bookService.searchBook(searchString: "test")
        let book = results[0]
        
        // Assert
        XCTAssertEqual("abcd123", book.id)
        XCTAssertEqual("SwiftUI Professional", book.title)
        XCTAssertEqual("All the minutia", book.subtitle)
        XCTAssertEqual("Sample description", book.description)
        // I would probably complete every field to thoroughly test this
    }
}
