//
//  AnimationExample.swift
//  SwiftUI100Days
//
//  Created by Jhonnatan Macias on 8/05/24.
//

import SwiftUI

struct AnimationExample: View {
    
    @State var animationAmount = 0.0
    
    var body: some View {
        
        AnimationControlling()
        Spacer()
       
        Button("Tap me") {
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                animationAmount += 360
            }
           
        }
        .padding(40)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(
            .degrees(animationAmount), axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        
        
//        return VStack {
//            Stepper("Scale Amount", 
//                    value: $animationAmount.animation(
//                .easeOut(duration: 1)
//                    .repeatCount(3, autoreverses: true)
//                    ),
//                    in: 1...10)
//            Spacer()
//            Button("Tap me") {
//                animationAmount += 1
//            }
//            .padding(40)
//            .background(.red)
//            .foregroundStyle(.white)
//            .clipShape(.circle)
//            .scaleEffect(animationAmount)
//        }
        
        
        /*
        Button("Tap me") {
//            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(.easeOut(duration: 1)
                    .repeatForever(autoreverses: false),
        //            .repeatCount(3, autoreverses: true),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }*/
        
    }
    
}

#Preview {
    AnimationExample()
}
