//
//  PhotPicker.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 11/02/25.
//

import PhotosUI
import SwiftUI

struct PhotPicker: View {
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()

    var body: some View {
        VStack {
            PhotosPicker(selection: $pickerItems, maxSelectionCount: 4, matching: .any(of: [.images, .not(.screenshots)])) {
                Label("Select a picture", systemImage: "photo")
            }
            
//            PhotosPicker(selection: $pickerItems, maxSelectionCount: 4, matching: .images) {
//                Label("Select a picture", systemImage: "photo")
//            }
            
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
           
        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()
                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}


#Preview {
    PhotPicker()
}


/*
 
 Array photos
 
 struct ContentView: View {
     @State private var pickerItems = [PhotosPickerItem]()
     @State private var selectedImages = [Image]()

     var body: some View {
         VStack {
             PhotosPicker("Select a picture", selection: $pickerItems, maxSelectionCount: 4, matching: .images)
             
             ScrollView {
                 ForEach(0..<selectedImages.count, id: \.self) { i in
                     selectedImages[i]
                         .resizable()
                         .scaledToFit()
                 }
             }
            
         }
         .onChange(of: pickerItems) {
             Task {
                 selectedImages.removeAll()
                 for item in pickerItems {
                     if let loadedImage = try await item.loadTransferable(type: Image.self) {
                         selectedImages.append(loadedImage)
                     }
                 }
             }
         }
     }
 }
 
 photo picker one phopto
 
 struct ContentView: View {
     @State private var pickerItem: PhotosPickerItem?
     @State private var selectedImage: Image?

     var body: some View {
         VStack {
             PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
             
             selectedImage?
                 .resizable()
                 .scaledToFit()
         }
         .onChange(of: pickerItem) {
             Task {
                 selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
             }
         }
     }
 }
 
 
 struct ContentView: View {
     @State private var showingConfirmation = false
     @State private var backgroundColor = Color.white

     var body: some View {
         VStack {
           Button("Random Blur") {
               showingConfirmation.toggle()
             }
           .frame(width: 300, height: 300)
           .background(backgroundColor)
           .confirmationDialog("Change background", isPresented: $showingConfirmation) {
                 Button("Red") {backgroundColor = .red }
                 Button("Green") {backgroundColor = .green }
                 Button("Yellow") {backgroundColor = .yellow }
                 Button("Cancel", role: .cancel) { }
             } message: {
                 Text("Select a new color")
             }
         }
     }
 }
 */
 

//because of the way SwiftUI sends binding updates to property wrappers, property observers used with property wrappers often won’t work the way you expect, which means this kind of code won’t print anything even as the blur radius changes:
//https://www.hackingwithswift.com/books/ios-swiftui/responding-to-state-changes-using-onchange

//struct ContentView: View {
//    @State private var blurAmount = 0.0
//
//    var body: some View {
//        VStack {
//
//            Text("Hello, world!")
//                .blur(radius: blurAmount)
//
//            Slider(value: $blurAmount, in: 0...20)
//
////            Button("Random Blur") {
////                blurAmount = Double.random(in: 0...20)
////            }
//        }
//        .onChange(of: blurAmount) { oldValue, newValue in
//            print("new value is \(newValue)")
//        }
//
//    }
//}
