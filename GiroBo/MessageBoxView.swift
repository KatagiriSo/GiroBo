//
//  MessageBoxView.swift
//  GiroBo
//
//  Created by developer on 2020/10/20.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import SwiftUI

struct MessageBoxView: View {
    @Binding var messageList:[Message]
    @Binding var isPresentPostSheet:Bool

    var body: some View {
        VStack {
            MessageListView(messageList:
                self.$messageList)
            
            Spacer().frame(width: 0, height: 30, alignment: .center)
            HStack {
                Button(action: {
                    self.isPresentPostSheet = true
                }) {
                    Text("投稿する")
                }
            }
            Spacer()
        }    }
}

struct MessageBoxView_Previews: PreviewProvider {
    @State static var dumm:[Message] = dummyEntity().messageList
    @State static var isPresentPostSheet:Bool = true
    static var previews: some View {
        MessageBoxView(messageList: $dumm, isPresentPostSheet: $isPresentPostSheet)
    }
}
