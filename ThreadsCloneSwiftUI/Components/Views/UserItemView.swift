//
//  SearchItemView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import SwiftUI

struct UserItemView: View {
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                AvatarImageView(user, imageSize: .small)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(user.userName)
                        .fontWeight(.semibold)
                    
                    Text(user.fullName)
                }
                .font(.footnote)
                
                Spacer()
                
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
            }
            .padding(.horizontal)
            
            Divider()
        }
        .padding(.vertical)
    }
}

#Preview {
    UserItemView(user: DeveloperPreview.mock.user)
}
