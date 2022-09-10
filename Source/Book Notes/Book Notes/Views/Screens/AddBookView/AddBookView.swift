//
//  AddBookView.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import SwiftUI

struct AddBookView: View {
    @StateObject private var viewModel = AddBookView.ViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Search")
                    .padding()
                
                TextField("Book Title or Author", text: $viewModel.bookSearch)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: .infinity)
                    .padding()
            }
            List(viewModel.searchResults) { book in
                
            }
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
