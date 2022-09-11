//
//  BookRow.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/9/22.
//

import SwiftUI

struct BookCoverView: View {
    @State var book:Book
    
    init(book:Book) {
        _book = State(initialValue: book)
    }
    
    
    var body: some View {
        VStack {
            AsyncImage(url: book.bookCoverThumbnail) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90)
            } placeholder: {
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .foregroundColor(Color.gray)
                        .frame(width: 90, height: 140)
                }
            }
            
            Text(book.title)
                .multilineTextAlignment(.center)
                .font(.caption)
                .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25, opacity: 1.0))
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookCoverView(book: MockBookService.defaultBooks[2])
    }
}
