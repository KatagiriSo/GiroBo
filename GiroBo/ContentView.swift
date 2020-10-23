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
    @ObservedObject var viewModel:MessageViewModel
    @ObservedObject var profileViewModel:ProfileViewModel
    
    var body: some View {
        mainContentView().sideView(animation: .spring()) {
            ProfileView(profileViewModel: self.profileViewModel)
        }
        .sheet(isPresented: $isPresentPostSheet, content: {PostView(showModal: self.$isPresentPostSheet)})
        .onAppear() {
                self.viewModel.onAppeared()
                self.profileViewModel.onAppeared()
        }
    }
    
    fileprivate func mainContentView() -> some View {
        return VStack {
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
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MessageViewModel(), profileViewModel: ProfileViewModel())
    }
}
