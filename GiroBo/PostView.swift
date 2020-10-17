//
//  PostView.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/16.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import SwiftUI
import Combine

struct PostView: View {
    @Binding var showModal:Bool
    @State private var message = ""
    @State private var textStyle = UIFont.TextStyle.body
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer(minLength: 70)
            VStack {
                HStack {
                    Spacer(minLength: 20)
                    EditView(text: $message, textStyle: $textStyle).border(Color.black, width: 1)
                    Spacer(minLength: 20)
                }
            }
            Spacer()
            Button(action: {
                UIApplication.shared.endEditing()
                self.showModal.toggle()
            }, label: {
                ZStack {
                    Color(red: 0.9, green: 0.8, blue: 0.5)
                    Text("投稿する").foregroundColor(Color.black).padding()
                }.fixedSize(horizontal: true, vertical: true)
            })
            Spacer()
        }
        
    }
    
}

struct PostView_Previews: PreviewProvider {
    @State static  var showModal:Bool = true
    static var previews: some View {
        PostView(showModal: self.$showModal)
    }
}
