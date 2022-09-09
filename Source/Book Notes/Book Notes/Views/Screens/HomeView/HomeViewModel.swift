//
//  HomeViewModel.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/9/22.
//

import Factory
import Foundation

extension HomeView {
    class ViewModel: ObservableObject {
        @Published var searchText = ""
        @Published private(set) var activeBooks:[AnyHashable] = []
        @Published private(set) var wishlistBooks:[AnyHashable] = []
        @Published private(set) var archivedBooks:[AnyHashable] = []
    }
}
