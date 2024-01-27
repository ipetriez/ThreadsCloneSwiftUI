//
//  RegistrationViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 27.01.24.
//

import Foundation

final class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var userName = ""
    
    @MainActor
    func registerNewUser() async throws {
        try await AuthService.shared.registerNewUser(with: email, password: password, fullName: fullName, userName: userName)
    }
}
