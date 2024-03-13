//
//  PickerExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 11/03/24.
//

import SwiftUI

struct PickerExample: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp: Date = .now
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 4...12, step: 0.25)
        EmptyView()
        DatePicker("", selection: $wakeUp,
                   displayedComponents: .hourAndMinute)
            .labelsHidden()
        
        DatePicker("Select a date", selection: $wakeUp,in: Date.now...)
        
        Text(Date.now, format: .dateTime.day().month().year())
        Text(Date.now.formatted(date: .long, time: .shortened))
    }
    
    func exampleDate() {
        let now = Date.now
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = now...tomorrow
        
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? .now
        var components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
    }
}

#Preview {
    PickerExample()
}
