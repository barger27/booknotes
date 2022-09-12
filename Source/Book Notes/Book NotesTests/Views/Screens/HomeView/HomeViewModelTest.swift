//
//  HomeViewModelTest.swift
//  Book NotesTests
//
//  Created by Ryan Barger on 9/11/22.
//
@testable import Book_Notes
import XCTest

class HomeViewModelTest: XCTestCase {
    private var viewModel:HomeView.ViewModel!
    private var bookService:MockBookService!
    
    
    override func setUpWithError() throws {
        bookService = MockBookService()
        viewModel = HomeView.ViewModel(bookService: bookService)
    }
    

    func test_loadBooks_returnsExpectedFilteredSets() async throws {
        // Assemble
        // Act
        await viewModel.loadBooks()
        
        // Assert
        XCTAssertEqual(1, viewModel.activeBooks.count)
        XCTAssertEqual(3, viewModel.wishlistBooks.count)
        XCTAssertEqual(1, viewModel.archivedBooks.count)
    }
}
