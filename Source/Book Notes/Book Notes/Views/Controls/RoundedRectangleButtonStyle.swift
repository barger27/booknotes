//
//  RoundedRectangleButtonStyle.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/10/22.
//

import SwiftUI

// source: https://www.fivestars.blog/articles/button-styles/
struct RoundedRectangleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label.foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(Color.blue.cornerRadius(8))
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
