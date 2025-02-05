//
//  Pills.swift
//  MeliVisionOS
//
//  Created by Jhonnatan Macias on 26/09/24.
//

import SwiftUI

struct Pills: View {
    let pills: [String]
    
    var body: some View {
        HStack {
            ForEach(pills, id: \.self) { pill in
                Text(pill.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.mint.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
        }
    }
}

#Preview {
    Pills(pills: Televisor.test.pills)
}
