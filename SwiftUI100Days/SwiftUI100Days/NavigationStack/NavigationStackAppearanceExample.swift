//
//  NavigationStackAppearanceExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 25/06/24.
//

import SwiftUI

struct NavigationStackAppearanceExample: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
    
        NavigationStack() {
      
            Text("Hello world")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Tap me") {
                            
                        }
                    }
                    
                }
            .navigationBarBackButtonHidden()
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue, for: .navigationBar)
            .toolbarColorScheme(.dark)
//            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    NavigationStackAppearanceExample()
}
