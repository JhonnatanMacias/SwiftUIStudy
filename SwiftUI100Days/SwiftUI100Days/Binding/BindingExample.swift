//
//  BindingExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 29/07/24.
//

import SwiftUI

struct PushButton: View {
    
    let title: String
//    @State var isOn: Bool
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
        var offColors = [Color(white: 0.6), Color(white: 0.4)]

        var body: some View {
            Button(title) {
                isOn.toggle()
            }
            .padding()
            .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
            .foregroundStyle(.white)
            .clipShape(.capsule)
            .shadow(radius: isOn ? 0 : 5)
        }
    
}

struct BindingExample: View {
    
    @State private var rememberMe = false
    
    
    var body: some View {
        VStack {
            PushButton(title: "Remember me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

#Preview {
    BindingExample()
}

/*
To be clear, @Bindable is used when you're accessing a shared class that uses the @Observable macro: You create it using @State in one view, so you have bindings available there, but you use @Bindable when sharing it with other views so SwiftUI can create bindings there too.

On the other hand, @Binding is used when you have a simple, value type piece of data rather than a separate class. For example, you have an @State property that stores a Boolean, a Double, an array of strings, etc, and you want to pass that around. That doesn't use the @Observable macro, so we can't use @Bindable. Instead, we use @Binding, so we can share that Boolean or integer in several places.

This behavior makes @Binding extremely important for whenever you want to create a custom user interface component. At their core, UI components are just SwiftUI views like everything else, but @Binding is what sets them apart: while they might have their local @State properties, they also expose @Binding properties that let them interface directly with other views.*/
