//
//  RegistrationView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 24.01.24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var vm = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("threads_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $vm.email)
                    .textInputAutocapitalization(.never)
                    .modifier(AuthFieldModifier())
                
                SecureField("Enter your password", text: $vm.password)
                    .modifier(AuthFieldModifier())
                
                SecureField("Enter your full name", text: $vm.fullName)
                    .modifier(AuthFieldModifier())
                
                SecureField("Enter your username", text: $vm.userName)
                    .modifier(AuthFieldModifier())
            }
            
            NavigationLink {
                Text("Placeholder")
            } label: {
                Text("Forgot password?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.vertical)
                    .padding(.trailing, 28)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Button {
                Task { try await vm.registerNewUser() }
            } label: {
                Text("Sign Up")
                    .modifier(AuthActionButtonModifier())
            }
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Log In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundStyle(.black)
                .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    RegistrationView()
}
