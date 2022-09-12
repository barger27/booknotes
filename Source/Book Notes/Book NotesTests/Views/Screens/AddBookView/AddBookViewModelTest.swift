//
//  AddBookViewModelTest.swift
//  Book NotesTests
//
//  Created by Ryan Barger on 9/10/22.
//
@testable import Book_Notes
import Factory
import XCTest

class AddBookViewModelTest: XCTestCase {
    private var viewModel:AddBookView.ViewModel!
    private var bookService:MockBookService!

    
    override func setUpWithError() throws {
        bookService = MockBookService()
        viewModel = AddBookView.ViewModel(bookService: bookService)
    }
    
    func test_onBookSelected_addingABookSetsProperValues() {
        // Assemble
        let book = MockBookService.defaultBooks[3]
        
        // Act
        viewModel.onBookSelected(book: book)
        
        // Assert
        XCTAssertEqual(book, viewModel.selectedBook)
        XCTAssertTrue(viewModel.isBookDetailsPresented)
    }
    
    func test_deselectBook_resetsStateBackToDefault() {
        // Assemble
        let book = MockBookService.defaultBooks[3]
        viewModel.onBookSelected(book: book)
        
        // Act
        viewModel.deselectBook()
        
        // Assert
        XCTAssertNil(viewModel.selectedBook)
        XCTAssertFalse(viewModel.isBookDetailsPresented)
    }
    
    func test_addSelectedBookToReadNow_withSelectdBookCallsBookService() async throws {
        // Assemble
        let testBook = MockBookService.defaultBooks[3]
        viewModel.onBookSelected(book: testBook)
        
        // Act
        let _ = await viewModel.addSelectedBookToReadNow()
        
        // Assert
        XCTAssertEqual(1, bookService.saveBookCalls)
    }
    
    func test_addSelectedBookToReadNow_setsTheStatusToReadList() async throws {
        // Assemble
        let testBook = MockBookService.defaultBooks[3]
        viewModel.onBookSelected(book: testBook)
        
        // Act
        let book = await viewModel.addSelectedBookToReadNow()
        XCTAssertNotNil(book)
        XCTAssertEqual(BookStatus.readList, book?.status)
    }
    
    func test_addSelectedBookToWishlist_withSelectdBookCallsBookService() async throws {
        // Assemble
        let testBook = MockBookService.defaultBooks[3]
        viewModel.onBookSelected(book: testBook)
        
        // Act
        let _ = await viewModel.addSelectedBookToWishlist()
        
        // Assert
        XCTAssertEqual(1, bookService.saveBookCalls)
    }
    
    func test_addSelectedBookToWishlist_setsTheStatusToReadList() async throws {
        // Assemble
        let testBook = MockBookService.defaultBooks[3]
        viewModel.onBookSelected(book: testBook)
        
        // Act
        let book = await viewModel.addSelectedBookToWishlist()
        XCTAssertNotNil(book)
        XCTAssertEqual(BookStatus.wishlist, book?.status)
    }
    
    func test_performSearch_callsServiceOnPause() async throws {
        // Assemble
        // Act
        viewModel.bookSearch = "a"
        viewModel.bookSearch = "ab"
        viewModel.bookSearch = "abc"
        
        try await Task.sleep(nanoseconds: 1_500_000_000)
        
        // Assert
        XCTAssertEqual(1, bookService.searchBookCalls)
    }
    
    func test_performSearch_callsServiceOnEachPause() async throws {
        // Assemble
        // Act
        viewModel.bookSearch = "a"
        try await Task.sleep(nanoseconds: 1_000_000_000)
        viewModel.bookSearch = "ab"
        viewModel.bookSearch = "abc"
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        // Assert
        XCTAssertEqual(2, bookService.searchBookCalls)
    }
}
