//
//  ListLayout.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 21/06/24.
//

import SwiftUI

struct ListLayout: View {
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    @State private var newWord = ""
    var body: some View {
            List {
                ForEach(missions, id: \.id) { mission in
                    NavigationLink {
                        MissionView(mission: mission,
                                    astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()

                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
                .listRowBackground(Color.darkBackground)
            }
            .listStyle(PlainListStyle())
          

        .navigationTitle("Moonshot")
        .background(.darkBackground)
        
    }
    
    
    init(missions: [Mission], astronauts: [String: Astronaut]) {
        self.missions = missions
        self.astronauts =  astronauts
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return ListLayout(missions: missions,
                       astronauts: astronauts)
        .preferredColorScheme(.dark)
}
