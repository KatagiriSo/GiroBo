//
//  RandomColor.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/16.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import SwiftUI

extension Color {
    static func random()->Color {
        let colors:[Color] = [.blue, .green, .pink, .yellow]
        return colors.randomElement()!
    }
}
