//
//  NewThreadView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 26.01.24.
//

import SwiftUI

struct NewThreadView: View {
    @Environment (\.dismiss) var dismiss
    @State private var text = ""
    @StateObject private var vm = NewThreadViewModel()
    private var user: User? { UserService.shared.currentUser }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    AvatarImageView(user, imageSize: .small)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user?.userName ?? "")
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
                        Task {
                            try await vm.publishThread(text)
                            dismiss()
                        }
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
