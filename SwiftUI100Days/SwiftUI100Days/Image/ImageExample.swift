//
//  ImageExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 23/01/24.
//

import SwiftUI

struct ImageExample: View {
    @State private var showingAlert = false
    
    var body: some View {
        
   VStack {
            Button("Delete selection") {
                showingAlert = true
            }
            .buttonStyle(.bordered)
            
            Button("Delete selection", role: .destructive,
                   action: executeDelete)
            .buttonStyle(.bordered)
            
            Button {
                print("action")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            .buttonStyle(.borderedProminent)
            .tint(.indigo)
            
            Button("Delete selection", role: .destructive,
                   action: executeDelete)
            .buttonStyle(.borderedProminent)
            .padding()
            
            Button("Image", role: .destructive,
                   action: executeDelete)
            .buttonStyle(.borderedProminent)
            .padding()
            
            Button {
                print(type(of: self.body))
            } label: {
                Label("Pencil", systemImage: "pencil.circle")
//                HStack {
//                    Image(systemName: "pencil.circle")
//                    Text("Pencil!")
//                }
            }
            .padding()
            .foregroundColor(.white)
            .background(.red)
            
            Image(systemName: "pencil.circle")
                .foregroundColor(.blue)
                .font(.largeTitle)
            
            Image("singapore")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 80)
       
       Text("Hola")
           .padding()
           .background(.red)
           .padding()
           .background(.blue)
           .padding()
           .background(.yellow)
        }
   .alert("Message", isPresented: $showingAlert) {
       Button("OK", role: .destructive) {}
       Button("Cancel", role: .cancel) {}
   } message: {
       Text("Please read this.")
   }
        
    }
        
        func executeDelete() {
            print("Now deleting....")
        }
}

#Preview {
    ImageExample()
}
