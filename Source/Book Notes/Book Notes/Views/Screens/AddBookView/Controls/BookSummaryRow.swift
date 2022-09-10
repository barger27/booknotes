//
//  BookSummaryRow.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//
import SwiftDate
import SwiftUI

struct BookSummaryRow: View {
    @State private var book:Book
    
    init(book: Book) {
        _book = State(initialValue: book)
    }

    var body: some View {
        HStack(alignment: .top) {
            if book.bookCoverThumbnail != nil {
                AsyncImage(url: book.bookCoverThumbnail) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60)
                        .padding()
                } placeholder: {
                    ProgressView()
                        .frame(width: 60)
                }
            } else {
                Rectangle()
                    .foregroundColor(Color.white)
                    .frame(width: 60)
            }
                
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(book.authors.joined(separator: ", "))
                    .font(.caption2)
                    .padding(.bottom, 4)
                    .padding(.leading, 20)
                
                Text(book.subtitle ?? "")
                    .font(.caption)
                
                HStack {
                    Spacer()
                    Text(book.publishedDate?.toFormat("MMMM yyyy") ?? "")
                        .font(.caption2)
                        .padding(.trailing, 8)
                }
            }
        }
    }
}

struct BookSummaryRow_Previews: PreviewProvider {
    static var previews: some View {
        let book = MockBookService.defaultBooks[1]
        
        BookSummaryRow(book: book)
    }
}
