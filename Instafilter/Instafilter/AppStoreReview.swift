//
//  AppStoreReview.swift
//  Instafilter
//
//  Created by Jhonnatan Macias on 11/02/25.
//

import StoreKit
import SwiftUI

struct AppStoreReview: View {
    
    @Environment(\.requestReview) var requestReview

    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    AppStoreReview()
}
