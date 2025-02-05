//
//  UITextViewExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 30/07/24.
//


import SwiftUI

struct UITextViewExample: View {
//Tip: @AppStorage is not designed to store secure information, so never use it for anything private.
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
            Spacer()
            TextField("Enter your text", text: $notes, axis: .vertical)
                           .textFieldStyle(.roundedBorder)
                           .padding()
            Spacer()
        }
    }
    
    
}

#Preview {
    UITextViewExample()
}

