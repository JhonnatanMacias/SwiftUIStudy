//
//  Student.swift
//  BookMark
//
//  Created by Jhonnatan Macias on 31/07/24.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
/*
https://www.hackingwithswift.com/books/ios-swiftui/introduction-to-swiftdata-and-swiftui
 This class is called a SwiftData model: it defines some kind of data we want to work with in our apps. Behind the scenes, @Model builds on top of the same observation system that @Observable uses, which means it works really well with SwiftUI.
 
 1 Step
 It takes three steps, starting with us defining the data we want to use in our app.
 That tells Swift we want to bring in all the functionality from SwiftData. import SwiftData
 
 2 Step
 writing a little Swift code to load that model.
 this code will tell SwiftData to prepare some storage for us on the iPhone.
 .modelContainer(for: Student.self)
 A model container is SwiftData's name for where it stores its data. The first time your app runs this means SwiftData has to create the underlying database file, but in future runs it will load the database it made previously.
 
 3 Step
 
 
 
 
 
 */
