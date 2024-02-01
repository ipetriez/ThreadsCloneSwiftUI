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
    
    func fetchThreads() async throws -> [Thread] {
        let documentSnapshot = try await Firestore.firestore().collection("threads").order(by: "timestamp", descending: true).getDocuments()
        return documentSnapshot.documents.compactMap { try? $0.data(as: Thread.self) }
    }
    
    func fetchThreads(forAuthor authorID: String) async throws -> [Thread] {
        let documentSnapshot = try await Firestore.firestore().collection("threads").whereField("authorID", isEqualTo: authorID).getDocuments()
        return documentSnapshot.documents
            .compactMap { try? $0.data(as: Thread.self) }
            .sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
}
