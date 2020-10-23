//
//  SideViewModifier.swift
//  GiroBo
//
//  Created by Katagiri11 on 2020/10/23.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import SwiftUI

struct SideViewModifier<SideContent>: ViewModifier where SideContent:View {
    var animation:() -> Animation = {.default}
    let sideView:() -> SideContent
    @State var rate: CGFloat = 0.9
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack {
                content
                    .frame(width: geometry.size.width, height: geometry.size.height)
                self.sideView()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x:-self.rate*geometry.size.width  )
                    .animation(self.animation())
                    .onTapGesture {
                        self.toggle()
                        //                        self.animation = .spring()
                }
            }
        }
    }
    
    func toggle() {
        if self.rate == 0.9 {
            self.rate = 0.0
        } else {
            self.rate = 0.9
        }
    }
    
    func slideAnimation(_ animation:Animation) -> SideViewModifier<SideContent> {
        return SideViewModifier(animation:{animation}, sideView: self.sideView)
    }
}

extension View {
    func sideView<SideView:View>(animation:Animation, view:@escaping () -> SideView) -> some View {
        self.modifier(SideViewModifier<SideView>(animation: {animation}, sideView: view))
    }
}

fileprivate struct TestView: View {
    @State var color:Color = Color.green
    var body: some View {
        color
    }
    func color(_ color:Color) -> TestView {
        return TestView(color: color)
    }
}

struct SideViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        TestView().sideView(animation: .default) {
            TestView().color(.blue)
        }
    }
}
