//
//  ContentViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 27.01.24.
//

import Foundation
import Combine
import Firebase

final class ContentViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        setupSubscriptions()
    }
    
    private func setupSubscriptions() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &subscriptions)
    }
}
