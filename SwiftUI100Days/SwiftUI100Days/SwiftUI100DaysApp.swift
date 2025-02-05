//
//  SwiftUI100DaysApp.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 23/01/24.
//

import SwiftData
import SwiftUI

@main
struct SwiftUI100DaysApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
