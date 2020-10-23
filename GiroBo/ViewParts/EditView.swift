//
//  EditView.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/14.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import SwiftUI
import UIKit
import Combine
// https://www.appcoda.com/swiftui-textview-uiviewrepresentable/
struct EditView: UIViewRepresentable {
    
    @Binding var text: String
    @Binding var textStyle:UIFont.TextStyle
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        textView.font = UIFont.preferredFont(forTextStyle: textStyle)
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.delegate = context.coordinator
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont.preferredFont(forTextStyle: textStyle)
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator($text)
    }
}

class Coordinator: NSObject, UITextViewDelegate {
    var text: Binding<String>
    
    init(_ text:Binding<String>) {
        self.text = text
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.text.wrappedValue = textView.text
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
    }
}

struct EditView_Previews: PreviewProvider {
    @State static var text:String = "text"
    @State static var textStyle:UIFont.TextStyle = UIFont.TextStyle.body
    static var previews: some View {
        EditView(text:self.$text, textStyle:self.$textStyle)
    }
}
