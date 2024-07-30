//
//  URLSessionExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 25/06/24.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct URLSessionExample: View {
    @State private var results = [Result]()

       var body: some View {
           AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"),
                      scale: 7) { image in
               image
                   .resizable()
                   .scaledToFit()
               
           } placeholder: {
               ProgressView()
           }
            .frame(width: .infinity, height: 100)
           
           AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
               if let image = phase.image {
                   image
                       .resizable()
                       .scaledToFit()
               } else if phase.error != nil {
                   Text("There was an error loading the image.")
               } else {
                   ProgressView()
               }
           }
           .frame(width: .infinity, height: 100)
           
           List(results, id: \.trackId) { item in
               VStack(alignment: .leading) {
                   Text(item.trackName)
                       .font(.headline)
                   Text(item.collectionName)
               }
           }
           .task {
               await loadData()
           }
       }
       
    
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("invalid url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid URL")
        }
    }
}

#Preview {
    URLSessionExample()
}
