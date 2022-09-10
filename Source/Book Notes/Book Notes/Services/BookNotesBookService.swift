//
//  BookNotesBookService.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import Foundation

class BookNotesBookService : BookServiceProtocol {
    func searchBook(searchString: String) async throws -> [Book] {
        print("Search Service is processing: " + searchString)
        return []
    }
}
