//
//  GradientsExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 31/01/24.
//

import SwiftUI

struct GradientsExample: View {
    var body: some View {
//        LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
//        LinearGradient(stops: [
//            Gradient.Stop(color: .white, location: 0.45),
//            .init(color: .black, location: 0.55)
//        ],
//                       startPoint: .top, endPoint: .bottom)
        
        /*RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)*/
        
      /*  AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, ./red], center: .center)*/
        Text("Hola Mundo")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .background(.indigo.gradient)
    }
}

#Preview {
    GradientsExample()
}
