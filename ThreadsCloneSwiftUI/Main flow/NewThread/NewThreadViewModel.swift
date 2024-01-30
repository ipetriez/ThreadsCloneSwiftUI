//
//  NewThreadViewModel.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 30.01.24.
//

import Foundation
import Firebase

final class NewThreadViewModel: ObservableObject {
    func publishThread(_ text: String) async throws {
        guard let ownerID = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(text: text, likes: 0, authorID: ownerID, timestamp: Timestamp())
        try await ThreadService.shared.publish(thread: thread)
    }
}
