//
//  MeliVisionOSApp.swift
//  MeliVisionOS
//
//  Created by Jhonnatan Macias on 24/08/24.
//

import SwiftUI

@main
struct MeliVisionOSApp: App {
    @State var tvVM = TelevisorVM()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(tvVM)
        }
        
        WindowGroup(id: "poster") {
            if let selection = tvVM.selection {
                TVPoster(tv: selection)
            }
        }
        .defaultSize(CGSize(width: 150, height: 250))
    }
}
