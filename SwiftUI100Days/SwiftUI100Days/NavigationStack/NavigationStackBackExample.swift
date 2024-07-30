//
//  NavigationStackBackExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 24/06/24.
//

import SwiftUI

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self,
                                                       from: data) {
                path = NavigationPath(decoded)
                return
            }
        }

        // Still here? Start with an empty path.
        path = NavigationPath()
    }

    func save() {
        guard let representation = path.codable else { return }
        
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

//struct DetailViewStack: View {
//    var number: Int
//    @Binding var path: NavigationPath
//    
//
//    var body: some View {
//        Text("Detail View \(number)")
//        NavigationLink("Go to ramdom number ", value: Int.random(in: 1...5))
//            .navigationTitle("Number \(number)")
//            .toolbar {
//                Button("HOME") {
//                    path = NavigationPath()
//                }
//            }
//    }
//
//}

struct DetailViews: View {
    var number: Int

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

struct NavigationStackBackExample: View {
    @State private var path = NavigationPath()
    @State private var pathStore = PathStore()
    
    var body: some View {
        
        NavigationStack(path: $pathStore.path) {
            Text("Inicio")
            DetailViews(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailViews(number: i)
                }
            
        }
    }
}

#Preview {
    NavigationStackBackExample()
}
