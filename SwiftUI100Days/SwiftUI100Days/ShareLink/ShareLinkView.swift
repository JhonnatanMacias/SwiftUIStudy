//
//  ShareLinkView.swift
//  Instafilter
//
//  Created by Jhonnatan Macias on 11/02/25.
//

import SwiftUI

struct ShareLinkView: View {
    var body: some View {
//        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!,
//        subject: Text("Learn swift here"), message: Text("Checkout the 100 days of swiftui "))
        
        let example = Image(.example)
        
//        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!) {
//            Label("Spread the word abouyt swift", systemImage: "swift")
//        }
        
        ShareLink(item: example, preview:  SharePreview("swift UI", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
    }
}

#Preview {
    ShareLinkView()
}

/*
 
 https://www.hackingwithswift.com/books/ios-swiftui/how-to-let-the-user-share-content-with-sharelink
 */
