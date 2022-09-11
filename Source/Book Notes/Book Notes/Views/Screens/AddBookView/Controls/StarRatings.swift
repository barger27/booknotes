//
//  StarRatings.swift
//  Book Notes
//
//  Created by Ryan Barger on 9/11/22.
//

import SwiftUI

struct StarRatings: View {
    @State var rating:Float? = nil
    @State var responses:Int? = nil
    
    private func getIconForRating(_ starNumber:Float) -> String {
        guard let rating = self.rating else {
            return ""
        }
        
        if rating >= starNumber {
            return "star.fill"
        }
        
        if rating >= (starNumber - 0.5) {
            return "star.leadinghalf.filled"
        }
        
        return "star"
    }
    
    var body: some View {
        HStack() {
            if rating != nil {
                Image(systemName: getIconForRating(1.0))
                    .foregroundColor(Color.yellow)
                
                Image(systemName: getIconForRating(2.0))
                    .foregroundColor(Color.yellow)
                
                Image(systemName: getIconForRating(3.0))
                    .foregroundColor(Color.yellow)
                
                Image(systemName: getIconForRating(4.0))
                    .foregroundColor(Color.yellow)
                
                Image(systemName: getIconForRating(5.0))
                    .foregroundColor(Color.yellow)
                
                if let responses = self.responses {
                    Text("(\(responses) reviews)")
                        .font(.caption)
                }
            }
        }
    }
}

struct StarRatings_Previews: PreviewProvider {
    static var previews: some View {
        StarRatings(rating: 2.5, responses: 35)
    }
}
