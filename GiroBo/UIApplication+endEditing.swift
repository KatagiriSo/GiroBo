//
//  UIApplication+endEditing.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/15.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
