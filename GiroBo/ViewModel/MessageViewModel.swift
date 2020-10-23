//
//  MessageViewModel.swift
//  GiroBo
//
//  Created by KatagiriSo on 2020/10/17.
//  Copyright © 2020 RodhosSoft. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class MessageViewModel : ObservableObject {
    @Published private(set) var themaEntity:ThemaEntity? = nil
    @Published var messageList:[Message] = []
    @Published private(set) var error:Error? = nil
    var cancels = [AnyCancellable]()
    
    func onAppeared() {
        // テーマ取得
        fetchThema(isTest: true)
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
            }) { themaEntity in
                self.themaEntity = themaEntity
                self.messageList = themaEntity.messageList
        }.store(in: &cancels)
    }
}


