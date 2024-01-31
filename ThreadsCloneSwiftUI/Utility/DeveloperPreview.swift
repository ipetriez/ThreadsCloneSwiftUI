//
//  DeveloperPreview.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 29.01.24.
//

import SwiftUI
import Firebase

final class DeveloperPreview {
    static let mock = DeveloperPreview()
    
    private init() { }
    
    let user = User(id: NSUUID().uuidString, fullName: "Default Name", email: "default.name@gmail.com", userName: "default.name")
    let thread = Thread(text: "This is my test thread for developer purposes. I hope you're not trying to debug it in server response.", likes: 2, author: User(id: NSUUID().uuidString, fullName: "Default Name", email: "default.name@gmail.com", userName: "default.name"), authorID: NSUUID().uuidString, timestamp: Timestamp())
}
