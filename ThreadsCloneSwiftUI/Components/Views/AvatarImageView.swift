//
//  AvatarImageView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import SwiftUI
import Kingfisher

struct AvatarImageView: View {
    private let user: User?
    
    var body: some View {
        if let imageURL = user?.profileImageURL {
            KFImage(URL(string: imageURL))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(.circle)
        } else {
            Image("avatar-placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(.circle)
        }
    }
    
    init(_ user: User?) {
        self.user = user
    }
}

#Preview {
    AvatarImageView(nil)
}
