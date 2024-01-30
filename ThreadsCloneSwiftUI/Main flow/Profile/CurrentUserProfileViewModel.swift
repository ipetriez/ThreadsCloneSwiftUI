//
//  ProfileViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import Combine
import Foundation

final class CurrentUserProfileViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    @Published var currentUser: User?
    
    init() {
        setupSubscriptions()
    }
    
    private func setupSubscriptions() {
        UserService.shared.$currentUser
            .receive(on: DispatchQueue.main)
            .sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &subscriptions)
    }
}
