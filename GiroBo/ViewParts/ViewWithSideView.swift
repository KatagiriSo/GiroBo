//
//  SideView.swift
//  GiroBo
//
//  Created by Katagiri11 on 2020/10/23.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import SwiftUI


struct ViewWithSideView<MainContent,SideContent>: View where MainContent : View, SideContent : View {
    
    let mainContent: () -> MainContent
    let sideContent: () -> SideContent
    var animation:() -> Animation
    @State var rate: CGFloat = 0.9
    
    init(animation:@escaping () -> Animation = {.default}, @ViewBuilder mainContent: @escaping () -> MainContent, @ViewBuilder sideContent: @escaping () -> SideContent) {
        self.mainContent = mainContent
        self.sideContent = sideContent
        self.animation = animation
    }
    

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                self.mainContent()
                self.sideContent()
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
    
    func slideAnimation(_ animation:Animation) -> some View {
        return ViewWithSideView(animation:{animation}, mainContent:self.mainContent, sideContent:self.sideContent)
    }
}

fileprivate struct TestView: View {
    @State var color:Color = Color.green
    var body: some View {
        color
    }
}


struct ViewWithSideView_Previews: PreviewProvider {
    static var previews: some View {
        let v0 = Text("BackGround")
        let v1 = TestView()
        return
            VStack {
                ViewWithSideView( mainContent:{v0},sideContent:{v1})
                ViewWithSideView(mainContent:{v0},sideContent:{v1})
                    .slideAnimation(.spring())
        }
    }
}
