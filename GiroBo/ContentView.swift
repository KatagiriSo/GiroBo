//
//  ContentView.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/14.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var isPresentPostSheet: Bool = false
    @State var closeProfileOffset: CGFloat = -10
    @State var openProfileOffset: CGFloat = -100
    @State var profileOffset: CGFloat = -10
    @State var messageText:String = ""
    @ObservedObject var viewModel:MessageViewModel
    @ObservedObject var profileViewModel:ProfileViewModel
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    VStack {
                        Spacer()
                        ThemaView(text: self.viewModel.themaEntity?.thema)
                        Spacer(minLength: 50)
                        MessageBoxView(messageList: self.$viewModel.messageList, isPresentPostSheet: self.$isPresentPostSheet)
                    }
                    .navigationBarTitle(
                        Text(""))
                    self.createProfile(geometry: geometry)
                }
            }
        }.sheet(isPresented: $isPresentPostSheet, content: {PostView(showModal: self.$isPresentPostSheet, messageText: self.$messageText)})
        .onAppear() {
            self.viewModel.onAppeared()
            self.profileViewModel.onAppeared()
        }
    }
    
    func toggleProfile() {
        if self.profileOffset == self.closeProfileOffset {
            self.profileOffset = self.openProfileOffset
        } else {
            self.profileOffset = self.closeProfileOffset
        }
    }
    
    func createProfile(geometry:GeometryProxy) -> some View {
        return ProfileView(profileViewModel: self.profileViewModel)
            .frame(width:geometry.size.width * 1)
            .offset(x: -( geometry.size.width +  self.profileOffset))
            .animation(.default)
            .onAppear {
                self.closeProfileOffset = -10
                self.openProfileOffset  = geometry.size.width * -1
                self.profileOffset = self.closeProfileOffset
            }
            .onTapGesture {
                self.toggleProfile()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MessageViewModel(), profileViewModel: ProfileViewModel())
    }
}
