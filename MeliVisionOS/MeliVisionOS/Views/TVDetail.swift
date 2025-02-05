//
//  TVDetail.swift
//  MeliVisionOS
//
//  Created by Jhonnatan Macias on 26/09/24.
//

import SwiftUI

struct TVDetail: View {
    @Environment(\.openWindow) private var open
    let tv: Televisor
    
    var body: some View {
        ScrollView {
            HStack(alignment: .top) {
                VStack {
                    AsyncImage(url: tv.poster) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350, height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } placeholder: {
                        Image(systemName: "tv")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .frame(width: 350, height: 250)
                            .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Button {
                        open(id: "poster")
                    } label: {
                        Text("Mostrar poster")
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(tv.title)
                        .font(.title)
                        .bold()
                    Text("Vendido Por \(tv.owner)")
                    Text("Tags:")
                        .font(.subheadline)
                        .bold()
                    Text(tv.tagsString)
                        .font(.subheadline)
                    Text("Pills:")
                        .font(.subheadline)
                        .bold()
                        .padding(.top)
                    Pills(pills: tv.pills)
                    Text(tv.overview)
                        .padding(.top)
                    Text("Rating")
                        .padding(.top)
                        .bold()
                    RatingView(rating: .constant(tv.runtime))
                        .frame(width: 100)
                    
                }
                .padding(.leading)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationTitle(tv.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    NavigationStack {
        TVDetail(tv: .test)
    }
}
