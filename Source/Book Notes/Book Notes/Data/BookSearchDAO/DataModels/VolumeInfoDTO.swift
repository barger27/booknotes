//
//  VolumeInfoDTO.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import Foundation

struct VolumeInfoDTO: Codable {
    var title:String?
    var subtitle:String?
    var authors:[String]? = []
    var publisher:String?
    var publishedDate:String?
    var description:String?
    var industryIdentifiers:[IndustryIdentifiersDTO]? = []
    var pageCount:Int?
    var printType:String?
    var averageRating:Float?
    var ratingsCount:Int?
    var imageLinks:ImageLinksDTO?
}
