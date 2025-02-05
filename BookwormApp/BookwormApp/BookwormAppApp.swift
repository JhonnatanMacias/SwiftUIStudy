//
//  BookwormAppApp.swift
//  BookwormApp
//
//  Created by Jhonnatan Macias on 1/08/24.
//

import SwiftData
import SwiftUI

@main
struct BookwormAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
