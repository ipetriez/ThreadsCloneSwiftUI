//
//  ExploreViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import Foundation

final class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await getAllUsers() }
    }
    
    @MainActor
    private func getAllUsers() async throws {
        users = try await UserService.shared.getAllUsers()
    }
}
