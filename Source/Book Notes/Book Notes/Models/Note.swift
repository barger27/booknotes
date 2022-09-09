//
//  Note.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/9/22.
//

import Foundation

struct Note : Identifiable {
    let id: UUID
    let bookID: String
    var chapter: Int?
    var title: String
    var note: String
}
