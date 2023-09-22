//
//  UnitTestingBootcampView.swift
//  MasteringSwiftUI
//
//  Created by Resat Pekgozlu on 07/09/2022.
//

/*
 
 1. Unit Tests
 - tests the business logic in your app
 
 2. UI Tests
 - tests the UI of your app
 
 */

import SwiftUI

struct UnitTestingBootcampView: View {
    
    @StateObject private var vm: UnitTestingBootcampViewModel
    
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestingBootcampViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        Text(vm.isPremium.description)
    }
}

struct UnitTestingBootcampView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestingBootcampView(isPremium: true)
    }
}
