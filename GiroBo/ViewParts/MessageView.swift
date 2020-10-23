//
//  MessageView.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/16.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import SwiftUI

struct MessageView: View {
    @State var name:String
    @State var message:String
    @State var nameBGColor:Color = Color.green
    @State var nameKey:String = "名前"
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
//            Divider().padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            HStack{
                ZStack {
                    nameBGColor
                    Text(self.nameKey).foregroundColor(Color.black)
                }.fixedSize(horizontal: true, vertical: true)
                Spacer()
                    .frame(width: 10.0)
                Text(name)
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            HStack {
                Text(message)
            }
            Divider().padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
        }.padding(EdgeInsets(top: 0,leading: 30,bottom: 0,trailing: 30))

    }
    func nameKey(_ name:String) -> MessageView {
        return MessageView(name: self.name, message: self.message, nameBGColor: self.nameBGColor, nameKey: name)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(name: "佐藤一郎", message:"いろいろ考えたけど、そういうことじゃないんじゃないかなとおもうんだよね。")
    }
}
