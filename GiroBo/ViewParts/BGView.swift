//
//  BGView.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/17.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import SwiftUI

struct BGView: View {
    @State var color:Color = Color.green
    var body: some View {
        color
    }
}

struct BGView_Previews: PreviewProvider {
    static var previews: some View {
        BGView()
    }
}
