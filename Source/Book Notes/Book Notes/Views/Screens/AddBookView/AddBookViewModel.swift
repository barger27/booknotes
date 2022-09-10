//
//  AddBookViewModel.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import Foundation

extension AddBookView {
    
    class ViewModel: ObservableObject {
        @Published var bookSearch:String = ""
        @Published var searchResults:[Book] = []
    }
}
