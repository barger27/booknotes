//
//  AddBookView.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import SwiftUI

struct AddBookView: View {
    @StateObject private var viewModel = AddBookView.ViewModel()
    
    init() {}
    
    init(viewModel: AddBookView.ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Search")
                    .padding()
                    
                TextField("Book Title or Author", text: $viewModel.bookSearch)
                    .disableAutocorrection(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            List(viewModel.searchResults) { book in
                BookSummaryRow(book: book)
            }
        }.navigationTitle("Add Book")
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AddBookView.ViewModel(bookList: MockBookService.defaultBooks)
        return AddBookView(viewModel: viewModel)
    }
}
