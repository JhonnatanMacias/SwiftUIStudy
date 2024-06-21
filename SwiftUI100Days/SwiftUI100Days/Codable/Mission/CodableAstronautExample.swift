//
//  CodableAstronautExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 4/06/24.
//

import SwiftUI

struct CodableAstronautExample: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingList = false
    
    
    var body: some View {
//        NavigationStack {
            Group {
                if !showingList {
                    GridLayout(missions: missions, astronauts: astronauts)
                        .transition(.slide)
                } else {
                    ListLayout(missions: missions, astronauts: astronauts)
                        .transition(.slide)
                }
            }

            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button  {
                    showingList.toggle()
                    
                       
                } label: {
                    Image(systemName: showingList ? "list.bullet" : "rectangle.grid.2x2")
                        .clipShape(.capsule)
                        .shadow(radius: 5)
                }
                .transition(.slide)
                .foregroundStyle(.white)
            }
//        }
        
    }
}

#Preview {
    CodableAstronautExample()
}
