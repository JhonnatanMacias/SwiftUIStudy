//
//  InstafilterExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 12/02/25.
//

import SwiftUI

struct InstafilterExample: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                //
                
                Spacer()
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                }
                
                HStack {
                    Button("Change Filter") {
                        
                    }
                    Spacer()
                    
                    //share picture
                }
            }
            .padding([.horizontal, .bottom])
        .navigationTitle("Instafilter")
        }
    }
}

#Preview {
    InstafilterExample()
}
