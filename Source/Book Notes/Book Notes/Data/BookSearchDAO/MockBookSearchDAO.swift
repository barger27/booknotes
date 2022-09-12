//
//  MockBookSearchDAO.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/11/22.
//

import Foundation

class MockBookSearchDAO : BookSearchDAOProtocol {
    private (set) var searchBooksCount = 0
    
    func searchBooks(search: String) async throws -> BooksResultDTO {
        searchBooksCount += 1
        
        return BooksResultDTO(kind: "books#volumes",
                              totalItems: 2386,
                              items: MockBookSearchDAO.defaultBookDTOs)
    }
    
    
    static var defaultBookDTOs = [
        BookDTO(id: "abcd123",
                selfLink: "https://www.google.com/books/abcd123",
                volumeInfo: VolumeInfoDTO(
                    title: "SwiftUI Professional",
                    subtitle: "All the minutia",
                    authors: [ "John Smith", "Jane Doe" ],
                    publisher: "Pearson Technology",
                    publishedDate: "2022-01-01",
                    description: "Sample description",
                    industryIdentifiers: [ IndustryIdentifiersDTO( type: "ISBN", identifier: "12345789") ],
                    pageCount: 100,
                    printType: "BOOK",
                    averageRating: 3.5,
                    ratingsCount: 125,
                    imageLinks: ImageLinksDTO(smallThumbnail: "https://www.google.com/img/abcd123/sm",
                                              thumbnail: "https://www.google.com/img/abcd123/lg")
                )
            ),
        BookDTO(id: "minimal123",
                selfLink: "https://www.google.com/books/minimal123",
                volumeInfo: VolumeInfoDTO(
                    publisher: "Pearson Technology",
                    publishedDate: "2022",
                    industryIdentifiers: [ IndustryIdentifiersDTO( type: "ISBN", identifier: "12345789") ],
                    printType: "BOOK",
                    imageLinks: ImageLinksDTO(smallThumbnail: "https://www.google.com/img/abcd123/sm",
                                              thumbnail: "https://www.google.com/img/abcd123/lg")
                )
            )
    ]
}

