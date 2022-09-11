//
//  Book.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/9/22.
//

import Foundation
import GRDB

struct Book: Identifiable, Equatable, Codable, FetchableRecord, MutablePersistableRecord {
    let id: String
    let title: String
    let subtitle: String?
    let description: String?
    let authors: [String]
    let publishedDate: Date?
    let pageCount:Int?
    let bookCoverURL: URL?
    let bookCoverThumbnail: URL?
    var status:BookStatus
    
    init(id:String, title:String, subtitle:String? = nil, description:String, authors:[String] = [],
         publishedDate: Date? = nil, pageCount:Int? = nil, bookCoverURL:URL? = nil,
         bookCoverThumbnail:URL? = nil, status:BookStatus = .unlisted)
    {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.authors = authors
        self.publishedDate = publishedDate
        self.pageCount = pageCount
        self.bookCoverURL = bookCoverURL
        self.bookCoverThumbnail = bookCoverThumbnail
        self.status = status
    }
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.title == rhs.title &&
        lhs.publishedDate == rhs.publishedDate
    }
}
