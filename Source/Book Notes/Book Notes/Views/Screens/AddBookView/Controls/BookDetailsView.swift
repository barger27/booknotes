//
//  BookDetailsView.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import SwiftUI

struct BookDetailsView: View {
    @State var book:Book
    
    private var onReadNowAction: (() -> Void)?
    private var onWishlistAction: (() -> Void)?
    private var onCloseAction: (() -> Void)?
    
    init(book:Book,
         onReadNowAction:(() -> Void)? = nil,
         onWishlistAction:(() -> Void)? = nil,
         onCloseAction: (() -> Void)? = nil)
    {
        _book = State(initialValue: book)
        self.onReadNowAction = onReadNowAction
        self.onWishlistAction = onWishlistAction
        self.onCloseAction = onCloseAction
    }
    
    func onClose(_ action: @escaping (() -> Void)) -> BookDetailsView {
        BookDetailsView(book: book,
                        onReadNowAction: onReadNowAction,
                        onWishlistAction: onWishlistAction,
                        onCloseAction: action)
    }
    
    func onReadNow(_ action: @escaping (() -> Void)) -> BookDetailsView {
        BookDetailsView(book: book,
                        onReadNowAction: action,
                        onWishlistAction: onWishlistAction,
                        onCloseAction: onCloseAction)
    }
    
    func onWishlist(_ action: @escaping (() -> Void)) -> BookDetailsView {
        BookDetailsView(book: book,
                        onReadNowAction: onReadNowAction,
                        onWishlistAction: action,
                        onCloseAction: onCloseAction)
    }
    
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                if book.bookCoverURL != nil {
                    AsyncImage(url: book.bookCoverThumbnail) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: UIScreen.main.bounds.size.height / 4)
                            .padding()
                    } placeholder: {
                        Rectangle()
                            .foregroundColor(Color.gray)
                            .frame(width: UIScreen.main.bounds.size.height / 6,
                                   height: UIScreen.main.bounds.size.height / 4)
                            .padding()
                    }
                }
                
                Text(book.title)
                    .font(.title)
                
                Text(book.authors.joined(separator: ", "))
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundColor(Color.yellow)
                    
                    Image(systemName: "star")
                        .foregroundColor(Color.yellow)
                }.padding()
                
                ScrollView {
                    Text(book.description ?? "No description.")
                }.padding(.horizontal, 40)
                
                HStack {
                    Button("Read Now") {
                        onReadNowAction?()
                    }
                    .buttonStyle(RoundedRectangleButtonStyle())
                    .frame(width: 150)
                    .padding()
                    
                    
                    Button("Wishlist") {
                        onWishlistAction?()
                    }
                    .buttonStyle(RoundedRectangleButtonStyle())
                    .frame(width: 150)
                    .padding()
                }
                
                Spacer()
            } // VStack
            
            Button {
                
            } label: {
                Image(systemName: "x.circle")
                    .foregroundColor(Color.red)
                    .font(.system(size: 50).bold())
                    .onTapGesture {
                        onCloseAction?()
                    }
            }
        } // ZStack
    } // body
} // BookDetailsView

struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailsView(book: MockBookService.defaultBooks[2])
    }
}
