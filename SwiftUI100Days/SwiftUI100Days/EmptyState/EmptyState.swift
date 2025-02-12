//
//  EmptyState.swift
//  Instafilter
//
//  Created by Jhonnatan Macias on 10/02/25.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        ContentUnavailableView("No snippets", systemImage: "swift", description: Text("you dont have any saved snippets yet"))
        
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
            
        } description: {
            Text("you dont have any saved snippets yet")
        } actions: {
            Button("Create snippet") {
               
              }
        }
    }
}

#Preview {
    EmptyState()
}
