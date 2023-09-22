//
//  AppNavBarView.swift
//  MasteringSwiftUI
//
//  Created by Resat Pekgozlu on 05/09/2022.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                CustomNavLink(destination:
                Text("Destination")
                 .customNavigationTitle("second screen")
                 .customNavigationSubtitle("subtitle showing")
                ) {
                    Text("Navigation")
                }
            }
            .customNavigationTitle("Custom title")
            .customNavigationBarBackButtonHiddenP(true)
        }
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}

extension AppNavBarView {
    
    private var defaultNavBarView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                NavigationLink(
                    destination:
                        Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarHidden(false)
                    
                    ,
                    label: {
                        Text("Navigate")
                    })
            }
            .navigationTitle("Nav title here")
        }
    }
}
