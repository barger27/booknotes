//
//  MockBookService.swift
//  Book NotesTests
//
//  Created by Ryan Barger on 9/10/22.
//

import Foundation


class MockBookService : BookServiceProtocol {   
    private(set) var searchBookCalls = 0
    
    func searchBook(searchString:String) async throws -> [Book] {
        searchBookCalls += 1
        
        return []
    }
}
