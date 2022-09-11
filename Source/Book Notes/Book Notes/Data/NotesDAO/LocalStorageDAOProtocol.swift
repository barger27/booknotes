//
//  NotesDAOProtocol.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import Foundation

protocol LocalStorageDAOProtocol {
    func readAllBooks() throws -> [Book]
    func saveBook(book:inout Book) throws
}
