//
//  BookServiceProtocol.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import Foundation

protocol BookServiceProtocol {
    func searchBook(searchString:String) async throws -> [Book]
    func saveBook(book:Book) async throws
    func loadAllBooks() async throws -> (active: [Book], wishlist: [Book], archived: [Book])
}
