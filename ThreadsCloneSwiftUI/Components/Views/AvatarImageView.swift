//
//  AvatarImageView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall, xSmall, small, medium, large, xLarge
    
    var diameter: CGFloat {
        switch self {
        case .xxSmall:
            28
        case .xSmall:
            32
        case .small:
            40
        case .medium:
            48
        case .large:
            64
        case .xLarge:
            80
        }
    }
}

struct AvatarImageView: View {
    private let user: User?
    private let size: ProfileImageSize
    
    var body: some View {
        if let imageURL = user?.profileImageURL {
            KFImage(URL(string: imageURL))
                .resizable()
                .scaledToFill()
                .frame(width: size.diameter, height: size.diameter)
                .clipShape(.circle)
        } else {
            Image("avatar-placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: size.diameter, height: size.diameter)
                .clipShape(.circle)
        }
    }
    
    init(_ user: User?, imageSize: ProfileImageSize) {
        self.user = user
        self.size = imageSize
    }
}

#Preview {
    AvatarImageView(nil, imageSize: .medium)
}
