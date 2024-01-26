//
//  SearchItemView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import SwiftUI

struct SearchItemView: View {
    var body: some View {
        VStack {
            HStack {
                AvatarImageView("av-2")
                
                VStack(alignment: .leading) {
                    Text("jimmycool")
                        .fontWeight(.semibold)
                    
                    Text("Jim Cool")
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
    SearchItemView()
}
