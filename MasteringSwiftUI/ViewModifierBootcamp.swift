//
//  ViewModifierBootcamp.swift
//  MasteringSwiftUI
//
//  Created by Resat Pekgozlu on 27/03/2022.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
//            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

extension View {
    
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack(spacing: 10) {
            
            Text("Hello World!")
                .font(.headline)
                .withDefaultButtonFormatting()
            
            Text("Hello Everyone!")
                .font(.subheadline)
                .withDefaultButtonFormatting(backgroundColor: .red)
            
            Text("Hello!")
                .font(.title)
                .modifier(DefaultButtonViewModifier(backgroundColor: .yellow))
        }.padding()
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}
