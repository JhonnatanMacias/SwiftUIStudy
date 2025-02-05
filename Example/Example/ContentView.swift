//
//  ContentView.swift
//  Example
//
//  Created by Jhonnatan Macias on 20/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationSplitView(sidebar: {
                Text("1")
            }, content: {
                Text("2")
            }, detail: {
                Text("3")
            })
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
