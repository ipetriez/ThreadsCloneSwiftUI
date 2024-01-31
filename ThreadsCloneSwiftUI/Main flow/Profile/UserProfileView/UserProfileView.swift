//
//  UserProfileView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 29.01.24.
//

import SwiftUI

struct UserProfileView: View {
    @State private var selectedSegment: Segment = .threads
    @State var user: User?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ProfileHeaderView(user: $user)
                
                Button(action: {}, label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                
                ProfileViewSegmentedControl(selectedSegment: $selectedSegment)
                
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { thread in
//                        ThreadItemView(thread: thread)
                    }
                }
            }
            .padding(.vertical,8)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    AuthService.shared.signOut()
                }, label: {
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(.black)
                })
            }
        }
        .padding(.horizontal)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    CurrentUserProfileView()
}
