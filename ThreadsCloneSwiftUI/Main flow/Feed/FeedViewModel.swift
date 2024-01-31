//
//  FeedViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import Foundation

@MainActor
final class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    init() {
        Task {
            try await fetchThreads()
            await fetchUserDataForThreads()
        }
    }
    
    func fetchThreads() async throws {
        threads = try await ThreadService.shared.fetchThreads()
    }
    
    private func fetchUserDataForThreads() async {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerID = thread.authorID
            do {
                let threadAuthor = try await UserService.shared.getUser(withID: ownerID)
                threads[i].author = threadAuthor
            } catch {
                print("Failed to get user withID \(ownerID). Reason: \(error)")
            }
        }
    }
}
