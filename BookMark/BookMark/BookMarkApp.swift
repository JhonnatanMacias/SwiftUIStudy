//
//  BookMarkApp.swift
//  BookMark
//
//  Created by Jhonnatan Macias on 31/07/24.
//

import SwiftData
import SwiftUI

@main
struct BookMarkApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}

/*
 
 The @main line tells Swift this is what launches our app. Internally this is what bootstraps the whole program when the user launches our app from the iOS Home Screen.
 The WindowGroup part tells SwiftUI that our app can be displayed in many windows. This doesn't do much on iPhone, but on iPad and macOS it becomes a lot more important.
 

we need to add a modifier to the WindowGroup so that SwiftData is available everywhere in our app:

A model container is SwiftData's name for where it stores its data. The first time your app runs this means SwiftData has to create the underlying database file, but in future runs it will load the database it made previously.
 
 https://www.hackingwithswift.com/books/ios-swiftui/introduction-to-swiftdata-and-swiftui
*/
