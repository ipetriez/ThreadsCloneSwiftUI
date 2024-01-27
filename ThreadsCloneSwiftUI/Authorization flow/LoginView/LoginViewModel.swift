//
//  LoginViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 27.01.24.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func loginUser() {
        Task { try await AuthService.shared.loginUser(with: email, password: password) }
    }
}
