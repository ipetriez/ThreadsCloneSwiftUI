//
//  AuthService.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 27.01.24.
//

import Firebase

final class AuthService {
    
    static let shared = AuthService()
    
    @Published var userSession: FirebaseAuth.User?
    
    private init() { 
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func registerNewUser(with email: String, password: String, fullName: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
        } catch {
            print("DEBUG: Failed to register new user with the following error: \(error)")
        }
    }
    
    @MainActor
    func loginUser(with email: String, password: String) async throws {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
        } catch {
            print("DEBUG: Failed to sign in with the following error: \(error)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        userSession = nil
    }
}
