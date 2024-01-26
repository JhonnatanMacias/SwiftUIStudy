//
//  ImageExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 23/01/24.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.blue)
            Text("Hello World")
        }
        .padding()
    }
}

#Preview {
    ImageExample()
}
