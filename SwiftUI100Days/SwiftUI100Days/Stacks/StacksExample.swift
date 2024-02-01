//
//  StacksExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 29/01/24.
//

import SwiftUI

struct StacksExample: View {
    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            Text("Hello World")
//            Text("This is another text view")
////            Spacer()
//        } .padding()
//        
//        HStack(spacing: 20) {
//            Text("Hello World")
//            Text("This is another text view")
//        }.padding()
       
        
        ZStack() {
//            Color.secondary
//            Color(red: 1, green: 0.8, blue: 0)
//                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            // Expand all the available space
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            Text("Your Content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
            
        }
        .ignoresSafeArea()
//        .background(.red)
    }
}

#Preview {
    StacksExample()
}
