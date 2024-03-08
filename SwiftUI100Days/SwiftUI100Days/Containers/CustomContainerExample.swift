//
//  CustomContainerExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 7/03/24.
//

import SwiftUI

struct GridStack<Content: View>: View {
   
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content // create a implicit HStack automatically for out content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                            content(row, column)
                    }
                }
            }
        }
    }
}

struct CustomContainerExample: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
                           
            }
            .padding()
            .border(Color.gray)
        }
    }
}

#Preview {
    CustomContainerExample()
}
