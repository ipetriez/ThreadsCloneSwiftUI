//
//  Thread.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 30.01.24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Thread: Codable, Identifiable {
    @DocumentID var threadID: String?
    var id: String { threadID ?? NSUUID().uuidString }
    var text: String
    var likes: Int
    var author: User?
    let authorID: String
    let timestamp: Timestamp
}
