//
//  User.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 28.01.24.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    let id: String
    let fullName: String
    let email: String
    let userName: String
    var profileImageURL: String?
    var bio: String?
}
