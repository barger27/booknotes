//
//  MockLocalStorageDAO.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/11/22.
//

import Foundation

class MockLocalStorageDAO : LocalStorageDAOProtocol {
    private (set) var readAllBooksCount = 0
    private (set) var saveBookCount = 0
    
    
    func readAllBooks() throws -> [Book] {
        readAllBooksCount += 1
        
        return MockBookService.defaultBooks
    }
    
    
    func saveBook(book: inout Book) throws {
        saveBookCount += 1
    }
}
