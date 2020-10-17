//
//  MessageView.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/16.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import SwiftUI

struct MessageView: View {
    @State var name:String = "佐藤一郎"
    @State var message:String = "いろいろ考えたけど、そういうことじゃないんじゃないかなとおもうんだよね。"
    @State var nameBGColor:Color = Color.green
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
//            Divider().padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            HStack{
                ZStack {
                    nameBGColor
                    Text("名前").foregroundColor(Color.black)
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
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
