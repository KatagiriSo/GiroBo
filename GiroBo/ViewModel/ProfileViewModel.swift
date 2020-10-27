//
//  ProfileViewModel.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/17.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ProfileViewModel : ObservableObject {
    @Published var profile:Profile = dummyProfile()
    var cancels = [AnyCancellable]()
    @Published private(set) var error:Error? = nil
    
    func onAppeared() {
        // プロフィール取得
        fetchProfile()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                    self.error = error
                    break
                case .finished:
                    break
                }
            }) { profile in
                self.profile = profile
        }.store(in: &cancels)
    }
    
}

struct ProfileViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
