//
//  AvatarImageView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import SwiftUI

struct AvatarImageView: View {
    private let imageName: String?
    
    var body: some View {
        Image(imageName ?? "avatar-placeholder")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(.circle)
    }
    
    init(_ imageName: String?) {
        self.imageName = imageName
    }
}

#Preview {
    AvatarImageView(nil)
}
