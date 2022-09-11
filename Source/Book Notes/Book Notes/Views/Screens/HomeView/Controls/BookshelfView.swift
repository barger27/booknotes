//
//  BookshelfView.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/11/22.
//

import SwiftUI

struct BookshelfView: View {
    @State var title:String
    @Binding var books:[Book]
    
    var body: some View {
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(books, id: \.id) { book in
                        BookCoverView(book: book)
                            .frame(maxWidth: 80)
                    }
                }
            }
        } header: {
            HStack {
                Text(title)
                    .bold()
                    .padding(8)
                    .foregroundColor(.white)
                Spacer()
            }.background(Color(red: 0.25, green: 0.25, blue: 0.25, opacity: 1.0))
        }
    }
}

struct BookshelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfView(title: "Test", books: .constant(MockBookService.defaultBooks))
    }
}
