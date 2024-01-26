//
//  NewThreadView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 26.01.24.
//

import SwiftUI

struct NewThreadView: View {
    @State private var text = ""
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    AvatarImageView("av-3")
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("charlie_moody")
                            .fontWeight(.semibold)
                        
                        TextField("Start thread...", text: $text, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !text.isEmpty {
                        Button(action: {
                            text = ""
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.gray)
                        })
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post") {
                        
                    }
                    .opacity(text.isEmpty ? 0.5 : 1.0)
                    .disabled(text.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    NewThreadView()
}
