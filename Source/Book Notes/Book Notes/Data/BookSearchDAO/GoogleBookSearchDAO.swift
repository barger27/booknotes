//
//  GoogleBookSearchDAO.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import Foundation

class GoogleBookSearchDAO : BookSearchDAOProtocol {
    var googleBooksAPI:String
    
    init(googleAPI:String) {
        self.googleBooksAPI = googleAPI
    }
    
    func searchBooks(search: String) async throws -> BooksResultDTO {
        let data:Data?
        let response:URLResponse?
        
        print("Raw: " + googleBooksAPI + search)
        let sanitizedURL = sanitizeURL(url: search)
        print("Sanitized: " + googleBooksAPI + sanitizedURL)
        
        guard let url = URL(string: googleBooksAPI + sanitizedURL) else {
            print("Invalid URL")
            throw GoogleAPIError.invalidURL
        }
        
        do {
            (data, response) = try await URLSession.shared.data(from: url)
            print(response.debugDescription)
        }
        catch {
            throw GoogleAPIError.transport
        }
        
        do {
            let result = try JSONDecoder().decode(BooksResultDTO.self, from: data!)
            return result
        } catch {
            throw GoogleAPIError.parsing
        }
    }
    
    private func sanitizeURL(url:String) -> String {
        // full disclosure... This came from a Stack Overflow answer
        // https://stackoverflow.com/questions/24551816/swift-encode-url
        let customAllowedSet =  CharacterSet(charactersIn: "=\"#%/<>?@\\^`{|} ").inverted
        let escapedString = url.addingPercentEncoding(withAllowedCharacters: customAllowedSet)
        
        return escapedString ?? url
    }
}


enum GoogleAPIError: Error {
    case invalidURL
    case transport
    case parsing
    case unknown
}
        
extension GoogleAPIError: CustomStringConvertible {
    public var description:String {
        switch self {
            case .invalidURL:
                return "The URL configured for Google API is invalid"
            case .transport:
                return "An error occurred retrieving the books data from the server"
            case .parsing:
                return "An error occurred parsing the results sent back from the server"
            case .unknown:
                return "An unknown error occurred"
        }
    }
}
