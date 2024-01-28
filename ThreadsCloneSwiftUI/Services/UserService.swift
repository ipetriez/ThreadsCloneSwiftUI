//
//  UserService.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 28.01.24.
//

import Firebase
import FirebaseFirestoreSwift

final class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    private init() {
        Task { try await getCurrentUser() }
    }
    
    @MainActor
    func getCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let documentSnapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try documentSnapshot.data(as: User.self)
        currentUser = user
    }
}
