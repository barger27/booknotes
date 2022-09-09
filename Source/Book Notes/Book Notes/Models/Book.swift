//
//  Book.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/9/22.
//

import Foundation

struct Book: Identifiable {
    let id: String
    let title: String
    let description: String?
    let authors: [String] = []
    let publishedDate: Date
    let pageCount:Int
    let bookCoverURL: String?
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.title == rhs.title &&
        lhs.publishedDate == rhs.publishedDate
    }
}
