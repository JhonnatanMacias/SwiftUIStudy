//
//  RatingView.swift
//  BookwormApp
//
//  Created by Jhonnatan Macias on 12/08/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow
   
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        .buttonStyle(.plain)
        
//      when we have rows inside a form or a list, SwiftUI likes to assume the rows themselves are tappable. This makes selection easier for users, because they can tap anywhere in a row to trigger the button inside it.
        
//        In our case we have multiple buttons, so SwiftUI is tapping them all in order – rating gets set to 1, then 2, then 3, 4, and 5, which is why it ends up at 5 no matter what.
//
//        We can disable the whole "tap the row to trigger its buttons" behavior with an extra modifier attached to the whole HStack:
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
