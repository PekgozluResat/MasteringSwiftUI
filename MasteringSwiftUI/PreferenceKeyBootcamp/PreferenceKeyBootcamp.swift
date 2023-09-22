//
//  PreferenceKeyBootcamp.swift
//  MasteringSwiftUI
//
//  Created by Resat Pekgozlu on 06/05/2022.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
    
    @State private var text: String = "Hello world!"
    
    var body: some View {
        NavigationView {
            VStack {
                SecondaryScreen(text: text)
                    .navigationTitle("Navigation title")
            }
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
            self.text = value
        }
    }
}

extension View {
    
    func customTitle(_ text: String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}

struct PreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyBootcamp()
    }
}

struct SecondaryScreen: View {
    
    let text: String
    @State private var newValue: String = ""
    
    var body: some View {
        Text(text)
            .onAppear {
                self.getDataFromDataBase()
            }
            .customTitle(newValue)
//            .preference(key: CustomTitlePreferenceKey.self, value: newValue)
    }
    
    func getDataFromDataBase() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.newValue = "New value from database!!"
        }
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}
