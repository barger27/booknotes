//
//  BookDTO.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import Foundation

struct BookDTO : Codable, Identifiable {
    var id:String
    var selfLink:String
    var volumeInfo:VolumeInfoDTO?
}
