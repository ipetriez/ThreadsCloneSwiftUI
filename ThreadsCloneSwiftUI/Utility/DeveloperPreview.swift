//
//  DeveloperPreview.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 29.01.24.
//

import SwiftUI

final class DeveloperPreview {
    static let mock = DeveloperPreview()
    
    private init() { }
    
    let user = User(id: NSUUID().uuidString, fullName: "Default Name", email: "default.name@gmail.com", userName: "default.name")
}
