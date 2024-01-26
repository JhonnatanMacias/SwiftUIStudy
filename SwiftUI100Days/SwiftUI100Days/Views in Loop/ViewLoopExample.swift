//
//  ViewLoopExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 25/01/24.
//

import SwiftUI

struct ViewLoopExample: View {
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a Student")
        }
        
    }
}

#Preview {
    ViewLoopExample()
}
