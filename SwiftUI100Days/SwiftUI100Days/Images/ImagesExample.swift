//
//  ImagesExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 28/05/24.
//

import SwiftUI

//called @Environment, and it allows us to create properties that store values provided to us externally.
struct ScrollViewExample: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                //            Although the code to use regular and lazy stacks is the same, there is one important layout difference: lazy stacks always take up as much as room as is available in our layouts, whereas regular stacks take up only as much space as is needed. This is intentional, because it stops lazy stacks having to adjust their size if a new view is loaded that wants more space.
                LazyVStack(spacing: 10) {
                    ForEach(0..<100) { index in
    
                        NavigationLink(destination: Text("Detail View")) {
                                            CustomText(text: "Item \(index)")
                                                .font(.largeTitle)
                                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
            }
            Button("Dismiss") {
                dismiss()
            }
        }
        
    }
}



struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        print("Creating a new CustomText \(text)")
        self.text = text
    }
}

struct ImagesExample: View {
    
    @State private var showingSheet = false
    
    
    var body: some View {
        
        NavigationStack {
            Image(.singapore)
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { size, Axis in
                    size * 0.8
                }
            
            Spacer()
            NavigationLink {
                Text("Detail View")
            } label: {
                VStack {
                    Text("Navigation Link")
                    Text("So this is")
                    Image(systemName: "face.smiling")
                }
                .font(.largeTitle)
            }
            
            Spacer()
            Button("Navigation") {
                NavigationExample()
            }
                
            Spacer()
            Button("Open") {
                showingSheet.toggle()
            }.sheet(isPresented: $showingSheet, content: {
                ScrollViewExample()
            })
            .navigationTitle("SwiftUI")
        }
        
    }
}

#Preview {
    ImagesExample()
}
