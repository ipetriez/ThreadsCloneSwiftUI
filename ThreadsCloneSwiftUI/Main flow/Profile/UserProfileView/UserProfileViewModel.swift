//
//  UserProfileViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 01.02.24.
//

import Foundation

@MainActor
final class UserProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var threads = [Thread]()
    private var authorID: String { user?.id ?? "" }
    
    init(user: User) {
        self.user = user
        Task { try await fetchThreads(forAuthor: authorID) }
    }
    
    private func fetchThreads(forAuthor authorID: String) async throws {
        var threads = try await ThreadService.shared.fetchThreads(forAuthor: authorID)
        
        for i in 0 ..< threads.count {
            threads[i].author = user
        }
        self.threads = threads
    }
}
