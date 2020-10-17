//
//  ProfileView.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/17.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var profileViewModel:ProfileViewModel
    var body: some View {
        VStack {
            Text("Profile").font(.largeTitle).fontWeight(.heavy)
                .underline()
                .foregroundColor(Color.black)
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 50, trailing: 0))
            
            HStack {
                Text("名前")
                    .fontWeight(Font.Weight.heavy)
                    .frame(width: 50, height: 50, alignment: .center)
                    .background(BGView(color:Color.green))
                Spacer()
                Text(self.profileViewModel.profile.name).foregroundColor(.black)
                    .fontWeight(Font.Weight.heavy)
                Spacer()
            }.padding()
                .border(Color.black, width: 1.0)
                .padding()
            Spacer()
        }.background(BGView(color: .yellow))
            .edgesIgnoringSafeArea(.all)
            .onAppear(
                ) {
                self.profileViewModel.onAppeared()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profileViewModel: ProfileViewModel())
    }
}
