//
//  FormExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 23/01/24.
//

import SwiftUI

struct FormExample: View {
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    Text("Form And Nav Bar")
                }
                
                Section {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
                
                Section {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World 10!")
                }
            }
            .navigationTitle("Form and Navigation")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    FormExample()
}
