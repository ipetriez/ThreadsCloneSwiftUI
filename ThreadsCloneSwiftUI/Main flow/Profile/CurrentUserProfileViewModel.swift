//
//  ProfileViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import Combine
import Foundation

@MainActor
final class CurrentUserProfileViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    @Published var currentUser: User?
    @Published var threads = [Thread]()
    
    init() {
        setupSubscriptions()
        Task { try await fetchThreads(forAuthor: currentUser?.id ?? "") }
    }
    
    private func setupSubscriptions() {
        UserService.shared.$currentUser
            .receive(on: DispatchQueue.main)
            .sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &subscriptions)
    }
    
    private func fetchThreads(forAuthor authorID: String) async throws {
        var threads = try await ThreadService.shared.fetchThreads(forAuthor: authorID)
        
        for i in 0 ..< threads.count {
            threads[i].author = currentUser
        }
        self.threads = threads
    }
}
