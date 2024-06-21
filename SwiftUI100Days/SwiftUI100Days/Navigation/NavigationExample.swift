//
//  NavigationExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 30/05/24.
//

import SwiftUI

struct NavigationExample: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { index in
                NavigationLink("Row: \(index)") {
                    Text("Details \(index)")
                }
            }
        }
    }

}

#Preview {
    NavigationExample()
}
