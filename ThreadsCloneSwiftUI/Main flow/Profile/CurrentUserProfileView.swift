//
//  ProfileView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var selectedSegment: Segment = .threads
    @StateObject private var vm = CurrentUserProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ProfileHeaderView(user: $vm.currentUser)
                    
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
                            ThreadItemView()
                        }
                    }
                }
                .padding(.vertical,8)
            }
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
