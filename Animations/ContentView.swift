//
//  ContentView.swift
//  Animations
//
//  Created by luis armendariz on 4/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAMount = 1.0
    @State private var enabled = false
    
    var body: some View {
        VStack {
            Button("Tap me"){
                animationAMount += 1
            }
            .padding(50)
            .background(.teal)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAMount)
                    .opacity(2 - animationAMount)
                    .animation(
                        .easeInOut(duration: 3)
                            .repeatForever(autoreverses: false),
                        value: animationAMount
                        
            )
         )
            Spacer(minLength: 50)
            
            Button("Tap me too!"){
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .animation(.default, value: enabled)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
        }
     
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
