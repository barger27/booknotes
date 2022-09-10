//
//  Factory.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//
import Factory
import Foundation

extension Container {
    // Service Registrations
    static let bookService = Factory(scope: .singleton) { BookNotesBookService() as BookServiceProtocol }
    
    // static let noteService = Factory(scope: .singleton) { BookNotesNoteService() as NoteServiceProtocol }
}
