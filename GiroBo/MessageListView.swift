//
//  MessageListView.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/16.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import SwiftUI
import UIKit

struct MessageListView: View {
    @Binding var messageList:[Message]
    var body: some View {        
        VStack {
            List(messageList, id:\.self) { message in
                MessageView(name: message.name, message: message.message, nameBGColor: Color.random())

            }
            .onAppear() {
                //iOS14では.listStyle(SidebarListStyle()
                UITableView.appearance().separatorStyle = .none
            }
            .onDisappear {
               //revert appearance so that it does not break other UI
               UITableView.appearance().separatorStyle = .singleLine
            }
        }
    }
}


struct MessageListView_Previews: PreviewProvider {

    @State static var dumm:[Message] = dummyEntity().messageList
    static var previews: some View {
        return MessageListView(messageList: $dumm)
    }
}
