//
//  ContentView.swift
//  MeliVisionOS
//
//  Created by Jhonnatan Macias on 24/08/24.
//

import SwiftUI
import RealityKit
//import RealityKitContent

struct ContentView: View {
    @Environment(TelevisorVM.self) private var tvVM
    
    var body: some View {
        NavigationSplitView {
            @Bindable var bvm = tvVM
            
            List(selection: $bvm.selection) {
                ForEach(tvVM.televisores) { tv in
                    TVRow(tv: tv)
                }
            }
            .navigationTitle("Televisores")
        } detail: {
            if let selection = tvVM.selection {
                TVDetail(tv: selection)
            } else {
                ContentUnavailableView("Elige un Televisor", systemImage: "tv",
                                       description: Text("Por favor, seleccione un TV en la barra lateral"))
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(TelevisorVM(interactor: DataInteractorTest()))
}
