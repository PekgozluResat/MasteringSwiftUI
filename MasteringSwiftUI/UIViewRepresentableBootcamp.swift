//
//  UIViewRepresentableBootcamp.swift
//  MasteringSwiftUI
//
//  Created by Resat Pekgozlu on 20/01/2023.
//

import SwiftUI

// Convert a UIView from UIKit to SwiftUI
struct UIViewRepresentableBootcamp: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text(text)
            HStack {
                Text("SwiftUI:")
                TextField("Type here", text: $text)
            }
            
            HStack {
                Text("UIKit:")
                UITextFieldViewRepresentable(text: $text)
                    .updatePlaceholder("New placeholder")
                    .frame(height: 55)
                    .background(Color.gray)
            }
        }
    }
}

struct UIViewRepresentableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewRepresentableBootcamp()
    }
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
    
    @Binding var text: String
    var placeHolder: String
    let placeHolderColor: UIColor
    
    init(text: Binding<String>, placeHolder: String = "Default placeholde...", placeHolderColor: UIColor = .red) {
        self._text = text
        self.placeHolder = placeHolder
        self.placeHolderColor = placeHolderColor
    }
    
    func makeUIView(context: Context) -> UITextField {
        
        let textField =  getTextField()
        textField.delegate = context.coordinator
        return textField
    }
    
    // from SwiftUI to UIKit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    private func getTextField() -> UITextField {
        let textfield = UITextField(frame: .zero)
        let placeholder = NSAttributedString(string: placeHolder, attributes: [
            .foregroundColor : placeHolderColor
        ])
        textfield.attributedPlaceholder = placeholder
        
        return textfield
    }
    
    func updatePlaceholder(_ text: String) -> UITextFieldViewRepresentable {
        
        var viewReprasentable = self
        viewReprasentable.placeHolder = text
        return viewReprasentable
    }
    
    // from UIKit to SwiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}

struct BasicUIViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
