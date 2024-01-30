//
//  ThreadService.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 30.01.24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

final class ThreadService {
    
    static let shared = ThreadService()
    
    private init() { }
    
    func publish(thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
}
