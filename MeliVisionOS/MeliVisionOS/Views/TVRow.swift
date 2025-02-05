//
//  TVRow.swift
//  MeliVisionOS
//
//  Created by Jhonnatan Macias on 26/09/24.
//

import SwiftUI

struct TVRow: View {
    let tv: Televisor
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(tv.title)
            Text(tv.owner)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .tag(tv)
    }
}

#Preview {
    TVRow(tv: .test)
}

