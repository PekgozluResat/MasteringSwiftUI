//
//  TabBarItem.swift
//  MasteringSwiftUI
//
//  Created by Resat Pekgozlu on 06/06/2022.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    
    case home, favorites, profile
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .favorites: return "heart"
        case .profile: return "person"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .favorites: return "Favorites"
        case .profile: return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return .red
        case .favorites: return .blue
        case .profile: return .green
        }
    }
}
