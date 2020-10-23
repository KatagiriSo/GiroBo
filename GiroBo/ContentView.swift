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
                        HStack {
                            Text("テーマ:")
                            Text(self.viewModel.themaEntity?.thema ?? "")
                            .font(.title)
                                
                        }
                        Spacer(minLength: 50)
                        VStack {
                            MessageListView(messageList:
                                self.$viewModel.messageList)
                        
                            Spacer().frame(width: 0, height: 30, alignment: .center)
                            HStack {
                                Button(action: {
                                    self.isPresentPostSheet = true
                                }) {
                                    Text("投稿する")
                                }
                            }
                            Spacer()
                        }
                    }
                    .navigationBarTitle(
                        Text(""))
                    ProfileView(profileViewModel: self.profileViewModel)
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
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MessageViewModel(), profileViewModel: ProfileViewModel())
    }
}
