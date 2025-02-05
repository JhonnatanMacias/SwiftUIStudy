//
//  UserCodable.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 17/07/24.
//

import CoreHaptics
import SwiftUI

@Observable
class UserCodableModel: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    
    var name = "Taylor"
}

struct UserCodable: View {
    
    @State private var counter = 0
    @State private var engine: CHHapticEngine?
    
    var body: some View {
        Spacer()
        Button("Encode Taylor", action: encodeTaylor)
        Spacer()
        
        Button("Tap Count: \(counter)") {
            counter += 1
        }
//        .sensoryFeedback(.increase, trigger: counter)
//        .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
        .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: counter)
        
        Spacer()
        
        Button("Tap Me", action: complexSuccess)
            .onAppear(perform: prepareHaptics)
        Spacer()
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()

        // create one intense, sharp tap
//        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
//        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
//        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
//        events.append(event)
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }

        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }

        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
}

func encodeTaylor() {
        let data = try! JSONEncoder().encode(UserCodableModel())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }

#Preview {
    UserCodable()
}

/*
https://www.hackingwithswift.com/books/ios-swiftui/adding-codable-conformance-to-an-observable-class
 
 {"_name":"Taylor","_$observationRegistrar":{}}. Our name property is now _name, there's also an observation registrar instance in the JSON.

**/
