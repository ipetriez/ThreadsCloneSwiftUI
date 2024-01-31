//
//  ThreadItemView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import SwiftUI

struct ThreadItemView: View {
    let thread: Thread
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                AvatarImageView(thread.author, imageSize: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(thread.author?.userName ?? "")
                            .fontWeight(.semibold)
                            .font(.footnote)
                        
                        Spacer()
                        
                        Text("\(thread.timestamp)")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button(action: {}, label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        })
                    }
                    
                    Text(thread.text)
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
    ThreadItemView(thread: DeveloperPreview.mock.thread)
}
