//
//  AppTabBarView.swift
//  MasteringSwiftUI
//
//  Created by Resat Pekgozlu on 05/06/2022.
//

import SwiftUI

struct AppTabBarView: View {
    
    @State private var selection: String = "Home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
//        defaultTabView
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.red
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            Color.blue
                .tabBarItem(tab: .favorites, selection: $tabSelection)
            
            Color.green
                .tabBarItem(tab: .profile, selection: $tabSelection)
        }
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabBarView()
    }
}

extension AppTabBarView {
    
    private var defaultTabView: some View {
        
        TabView(selection: $selection ) {
//            Text("Tab Content 1").tabItem { Text("Tab Label 1") }.tag(1)
//            Text("Tab Content 2").tabItem { Text("Tab Label 2") }.tag(2)
            Color.red
                .tabItem {
                Image(systemName: "house")
                Text("home")
            }
            Color.blue
                .tabItem {
                Image(systemName: "heart")
                Text("Favorites")
            }
                
            Color.orange
                .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}
