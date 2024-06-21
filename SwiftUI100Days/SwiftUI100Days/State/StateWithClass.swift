//
//  StateWithClass.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 21/05/24.
//
import Observation
import SwiftUI

//look at the properties inside the view and reload any view
// that relies on the property when it changes
@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct StateWithClass: View {
    @State private var user = User()

        var body: some View {
            VStack {
                Text("Your name is \(user.firstName) \(user.lastName).")

                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
            }
        }
}

#Preview {
    StateWithClass()
}
/*
All three of those are important, but it's the middle one that is doing the heavy lifting: iOS keeps track of every SwiftUI view that reads properties from an @Observed object, so that when a property changes it can intelligently update all the views that depend on it while leaving the others unchanged.

When working with structs, the @State property wrapper keeps a value alive and also watches it for changes. On the other hand, when working with classes, @State is just there for keeping object alive – all the watching for changes and updating the view is taken care of by @Observable.*/
