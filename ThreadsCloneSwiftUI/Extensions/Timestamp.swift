//
//  Timestamp.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 01.02.24.
//

import Firebase

extension Timestamp {
    func formattedString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
