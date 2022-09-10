//
//  AddBookViewModelTest.swift
//  Book NotesTests
//
//  Created by Ryan Barger on 9/10/22.
//
import XCTest

class AddBookViewModelTest: XCTestCase {
    private var viewModel:AddBookView.ViewModel!
    private var bookService = MockBookService()
    
    
    override func setUpWithError() throws {
        viewModel = AddBookView.ViewModel(bookService: bookService)
    }
}
