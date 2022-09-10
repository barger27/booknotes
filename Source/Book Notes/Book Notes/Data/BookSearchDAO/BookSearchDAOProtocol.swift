//
//  BookSearchDAO.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import Foundation

protocol BookSearchDAOProtocol {
    func searchBooks(search:String) async throws -> BooksResultDTO
}
