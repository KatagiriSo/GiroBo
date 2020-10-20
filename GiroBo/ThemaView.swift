//
//  ThemaView.swift
//  GiroBo
//
//  Created by developer on 2020/10/20.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import SwiftUI

struct ThemaView: View {
    var text:String?
    var body: some View {
        return HStack {
            Text("テーマ:")
            Text(self.text ?? "")
            .font(.title)
                
        }
    }
}

struct ThemaView_Previews: PreviewProvider {
    @State static var text:String? = "明日はなぜくるのか"
    static var previews: some View {
        ThemaView(text: self.text)
    }
}
