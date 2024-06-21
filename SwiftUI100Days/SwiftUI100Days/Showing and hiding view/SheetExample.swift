//
//  SheetExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 22/05/24.
//

import SwiftUI
//called @Environment, and it allows us to create properties that store values provided to us externally.
struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct OnDelete: View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Numbers") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct UserDefault: View {
    @Environment(\.dismiss) var dismiss
    
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "tap")
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Spacer()
        
        Button("Tap Count \(tapCount)") {
           tapCount += 1
            
//            UserDefaults.standard.set(tapCount, forKey: "tap")
        }
        
        Spacer()
        
        Button("Dismiss") {
           dismiss()
        }
        Spacer()
    }
}

struct UserC: View {
    @Environment(\.dismiss) var dismiss
    @State private var user = UserCustom(firstName: "John", lastName: "Swift")
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Spacer()
        
        Button("Save User") {
           let encoder = JSONEncoder()
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
            
//            UserDefaults.standard.set(tapCount, forKey: "tap")
        }
        
        Spacer()
        
        Button("Dismiss") {
           dismiss()
        }
        Spacer()
    }
}


struct UserCustom: Codable {
    let firstName: String
    let lastName: String
}

struct SheetExample: View {
    
    @State private var showingSheet = false
    @State private var showingDelete = false
    @State private var showingUserD = false
    @State private var showingUserC = false
    
    var body: some View {
        Spacer()
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet, content: {
            SecondView(name: "Joe")
        })
        Spacer()
        Button("On delete") {
               showingDelete.toggle()
        }
        .sheet(isPresented: $showingDelete, content: {
            OnDelete()
        })
        Spacer()
        
        Spacer()
        Button("User Default") {
            showingUserD.toggle()
        }
        .sheet(isPresented: $showingUserD, content: {
            UserDefault()
        })
        Spacer()
        
        Spacer()
        Button("User Codable") {
            showingUserC.toggle()
        }
        .sheet(isPresented: $showingUserC, content: {
            UserC()
        })
        Spacer()

        
    }
}

#Preview {
    SheetExample()
}
