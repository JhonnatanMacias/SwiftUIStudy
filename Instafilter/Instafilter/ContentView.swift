//
//  ContentView.swift
//  Instafilter
//
//  Created by Jhonnatan Macias on 10/02/25.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    @State private var showingFilters = false
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    let context = CIContext()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .onChange(of: selectedItem, loadImage)
//                .buttonStyle(.plain)
                Spacer()
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                    .onChange(of: filterIntensity, applyProcessing)
                }
                
                HStack {
                    Button("Change Filter", action: chanceFilter)
                    Spacer()
                    
                    //share picture
                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("InstaFilter Image", image: processedImage))
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Edges Work") { setFilter(CIFilter.edgeWork()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignete") { setFilter(CIFilter.vignette()) }
                Button("Cancel", role: .cancel) {}
            }
        }
    }
    
    func chanceFilter() {
        showingFilters = true
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else {return
            }
            
            guard let inputImage = UIImage(data: imageData) else { return }
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    @MainActor func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
        
        filterCount += 1
        if filterCount >= 2 {
            requestReview()
        }
    }
    
    func applyProcessing() {
//        currentFilter.intensity = Float(filterIntensity)
        let inputKyes = currentFilter.inputKeys
        if inputKyes.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        
        if inputKyes.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
        }
        
        if inputKyes.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }
        
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
}


/*
 https://www.hackingwithswift.com/books/ios-swiftui/basic-image-filtering-using-core-image
 struct ContentView: View {
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

#Preview {
    ContentView()
}
