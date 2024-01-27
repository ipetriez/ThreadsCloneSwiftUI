//
//  LoginView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 24.01.24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var vm = LoginViewModel()
    
    var body: some View {
        NavigationStack {
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
                    vm.loginUser()
                } label: {
                    Text("Login")
                        .modifier(AuthActionButtonModifier())
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundStyle(.black)
                    .padding(.vertical, 16)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
