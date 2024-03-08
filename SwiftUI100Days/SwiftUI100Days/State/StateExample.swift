//
//  StateExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 25/01/24.
//

import SwiftUI

struct StateExample: View {
    
    @State var tapCount = 0
    
    @State var name = ""
    
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
   
    var spellsG: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
   
    var spellsV: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter your name", text: $name)
                Text("Hello world \(name)")
                
                Section {
                    Button("count \(tapCount)") {
                        tapCount += 1
                    }
                    Text("Hello world \(tapCount)")
                }
                
            }
            
            .navigationTitle("State and Binding State ")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

#Preview {
    StateExample()
}
