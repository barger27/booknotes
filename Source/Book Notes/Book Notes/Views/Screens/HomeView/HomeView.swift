//
//  ContentView.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/8/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeView.ViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ZStack(alignment: .center) {
                    Image("OldBooks")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(height: 180)
                        
                    TextField("Note Search",
                              text: $viewModel.noteSearchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: min(UIScreen.main.bounds.size.width * 0.80, 350))
                }
                
                HStack {
                    Spacer()
                    NavigationLink("Add Book",
                                   destination: AddBookView(),
                                   isActive: $viewModel.isShowingAddBook)
                        .padding()
                }

                BookshelfView(title: "Actively Reading", books: $viewModel.activeBooks)
                BookshelfView(title: "Wishlist", books: $viewModel.wishlistBooks)
                BookshelfView(title: "Archived", books: $viewModel.archivedBooks)
                Spacer()
            }
            .navigationBarHidden(true)
            .navigationTitle("Book Library")
            .task {
                await viewModel.loadBooks()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
