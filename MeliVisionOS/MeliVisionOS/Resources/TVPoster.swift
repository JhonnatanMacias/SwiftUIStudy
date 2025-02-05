//
//  TVPoster.swift
//  MeliVisionOS
//
//  Created by Jhonnatan Macias on 26/09/24.
//

import SwiftUI

struct TVPoster: View {
    let tv: Televisor
    var body: some View {
        AsyncImage(url: tv.poster) { image in
            image
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } placeholder: {
            Image(systemName: "tv")
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 150, height: 250)
                .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    TVPoster(tv: .test)
}
