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
            VStack {
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
                List {
                    Section {
                        ForEach(viewModel.activeBooks, id: \.self) { book in
                            BookRow()
                        }
                    } header: {
                        Text("Active Books")
                    }
                    Section("Wishlist") {
                        ForEach(viewModel.wishlistBooks, id: \.self) { book in
                            BookRow()
                        }
                    }
                    Section("Archive") {
                        ForEach(viewModel.archivedBooks, id: \.self) { book in
                            BookRow()
                        }
                    }
                }
                .listStyle(.grouped)
            }
            .navigationBarHidden(true)
            .navigationTitle("Book Library")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
