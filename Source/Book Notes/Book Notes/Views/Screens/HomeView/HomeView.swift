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
                        .scaledToFill()
                        .shadow(color: Color.black, radius: 20, x: 10, y: 10)
                        .frame(height: 200)
                        
                    TextField("Note Search",
                              text: $viewModel.searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color.white)
                        .frame(width: min(UIScreen.main.bounds.size.width * 0.80, 350))
                }
                
                List {
                    Section {
                        ForEach(viewModel.activeBooks, id: \.self) { book in
                            BookRow()
                        }
                    } header: {
                        HStack {
                            Text("Active Books")
                            Spacer()
                            Button {
                                
                            } label: {
                                Image(systemName: "plus.circle.fill")
                            }
                        }
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
