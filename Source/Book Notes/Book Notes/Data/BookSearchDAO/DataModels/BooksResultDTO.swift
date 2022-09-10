//
//  BooksResultDTO.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import Foundation

struct BooksResultDTO: Codable {
    let kind:String
    let totalItems:Int
    let items:[BookDTO]
}
