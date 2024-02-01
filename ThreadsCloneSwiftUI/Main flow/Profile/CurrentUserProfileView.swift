//
//  ProfileView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var selectedSegment: Segment = .threads
    @State private var showEditProfile = false
    @StateObject private var vm = CurrentUserProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ProfileHeaderView(user: $vm.currentUser)
                    
                    Button(action: {
                        showEditProfile.toggle()
                    }, label: {
                        Text("Edit profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    })
                    
                    ProfileViewSegmentedControl(selectedSegment: $selectedSegment)
                    
                    LazyVStack {
                        ForEach(vm.threads) { thread in
                            ThreadItemView(thread: thread)
                        }
                    }
                }
                .padding(.vertical,8)
            }
            .sheet(isPresented: $showEditProfile, content: {
                if let user = vm.currentUser {
                    EditProfileView(user: user)
                }
            })
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
}

#Preview {
    CurrentUserProfileView()
}
