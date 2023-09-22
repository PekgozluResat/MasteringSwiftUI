//
//  ButtonStyleBootcamp.swift
//  MasteringSwiftUI
//
//  Created by Resat Pekgozlu on 27/03/2022.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
//            .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

extension View {
    
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct ButtonStyleBootcamp: View {
    
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Text("Click me!")
                    .font(.headline)
                    .withDefaultButtonFormatting()
            }
            .buttonStyle(PressableButtonStyle(scaledAmount: 0.5))
            
            Button {
                
            } label: {
                Text("Click me!")
                    .withDefaultButtonFormatting()
            }
            .withPressableStyle()
            
            Button {
                
            } label: {
                Text("Click me!")
                    .withDefaultButtonFormatting(backgroundColor: .red)
            }
            .withPressableStyle(scaledAmount: 1.2)
        }
        .padding(40)
    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
    }
}
