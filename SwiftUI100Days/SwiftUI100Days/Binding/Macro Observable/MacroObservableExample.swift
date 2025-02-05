//
//  MacroObservableExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 31/07/24.
//

import SwiftUI
import Observation

@Observable
class Model {
    var myString: String = "Hello"
}

struct MacroObservableExample: View {
    @State var model: Model

    var body: some View {
        VStack {
            Text("my String: \(model.myString)")
            Button("Hit me") {
                model.myString = "new"
            }
        }
    }
}


#Preview {
    MacroObservableExample(model: Model())
}


//https://betterprogramming.pub/ios-17-observable-and-the-observation-framework-152deaf8fc5e
//https://developer.apple.com/videos/play/wwdc2023/10149/?time=504
