//
//  RegistrationPlateView.swift
//  MasteringSwiftUI
//
//  Created by Resat Pekgozlu on 12/08/2022.
//

import SwiftUI

struct RegistrationPlateView: View {
    var body: some View {
        ZStack {
            RegistrationPlateContainer() {
                
            }
                
        }
    }
}

struct RegistrationPlateView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationPlateView()
    }
}


struct RegistrationPlateContainer<T: View>: View {
    
    var content: () -> T
    
    init (@ViewBuilder content: @escaping () -> T) {
        self.content = content
    }

    var body: some View {
            
        HStack(spacing: 0) {
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 30, height: 40,alignment: .leading)
        
            ZStack {
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: 160, height: 40)
                HStack(spacing: 10, content: content).padding()
            }
        }
       
    }
}
