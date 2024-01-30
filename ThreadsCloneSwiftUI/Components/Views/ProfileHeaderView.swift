//
//  ProfileHeaderView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 29.01.24.
//

import SwiftUI

struct ProfileHeaderView: View {
    @Binding var user: User?
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullName ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.userName ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("13 followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            AvatarImageView(user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: .constant(DeveloperPreview.mock.user))
}
