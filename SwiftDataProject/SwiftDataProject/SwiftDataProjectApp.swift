//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Jhonnatan Macias on 28/10/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
