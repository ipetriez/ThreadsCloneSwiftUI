//
//  AuthService.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 27.01.24.
//

import Firebase
import FirebaseFirestore

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
            userSession = result.user
            try await uploadUserData(result.user.uid, email: email, fullName: fullName, userName: userName)
        } catch {
            print("DEBUG: Failed to register new user with the following error: \(error)")
        }
    }
    
    @MainActor
    func loginUser(with email: String, password: String) async throws {
        do {
            userSession = try await Auth.auth().signIn(withEmail: email, password: password).user
            try await UserService.shared.getCurrentUser()
        } catch {
            print("DEBUG: Failed to sign in with the following error: \(error)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        userSession = nil
        UserService.shared.currentUser = nil
    }
    
    @MainActor
    private func uploadUserData(_ userID: String, email: String, fullName: String, userName: String) async throws {
        let user = User(id: userID, fullName: fullName, email: email, userName: userName)
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(userID).setData(userData)
            UserService.shared.currentUser = user
        } catch {
            print("DEBUG: Failed to upload user data with the following error: \(error)")
        }
    }
}
