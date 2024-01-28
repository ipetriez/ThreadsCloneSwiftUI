//
//  ProfileViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import Combine

final class ProfileViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    @Published var currentUser: User?
    
    init() {
        setupSubscriptions()
    }
    
    private func setupSubscriptions() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &subscriptions)
    }
}
