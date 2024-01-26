//
//  ProfileView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedSegment: Segment = .threads
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Charlie Moody")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("charlie_moody")
                                .font(.subheadline)
                        }
                        
                        Text("Some random Charlie")
                            .font(.footnote)
                        
                        Text("13 followers")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    AvatarImageView("av-3")
                }
                
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
        .padding(.horizontal)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ProfileView()
}
