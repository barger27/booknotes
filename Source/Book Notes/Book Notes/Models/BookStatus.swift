//
//  BookStatus.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import Foundation

enum BookStatus : String, Codable {
    case readList = "read"
    case wishlist = "wish"
    case removed  = "deleted"
    case unlisted = "unlisted"
}
