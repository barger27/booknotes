//
//  NoteServiceProtocol.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import Foundation


protocol NoteServiceProtocol {
    func searchNotes(searchString:String) -> [Note]
}
