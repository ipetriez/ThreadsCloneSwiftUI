//
//  ThreadItemView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import SwiftUI

struct ThreadItemView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                AvatarImageView(nil, imageSize: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Chuck Conor")
                            .fontWeight(.semibold)
                            .font(.footnote)
                        
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button(action: {}, label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        })
                    }
                    
                    Text("Some cool guy")
                        .multilineTextAlignment(.leading)
                        .font(.footnote)
                    
                    HStack(spacing: 16) {
                        Button(action: {}, label: {
                            Image(systemName: "heart")
                        })
                        
                        Button(action: {}, label: {
                            Image(systemName: "bubble.right")
                        })
                        
                        Button(action: {}, label: {
                            Image(systemName: "arrow.rectanglepath")
                        })
                        
                        Button(action: {}, label: {
                            Image(systemName: "paperplane")
                        })
                    }
                    .foregroundStyle(.black)
                    .padding(.vertical, 8)
                }
            }
            
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadItemView()
}
