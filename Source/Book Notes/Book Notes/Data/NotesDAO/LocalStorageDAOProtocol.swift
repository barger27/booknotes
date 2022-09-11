//
//  NotesDAOProtocol.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import Foundation

protocol LocalStorageDAOProtocol {
    func saveBook(book:inout Book)
}
