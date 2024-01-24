//
//  RegistrationView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 24.01.24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var userName = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("threads_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $email)
                    .textInputAutocapitalization(.never)
                    .modifier(AuthFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(AuthFieldModifier())
                
                SecureField("Enter your full name", text: $fullName)
                    .modifier(AuthFieldModifier())
                
                SecureField("Enter your username", text: $userName)
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
                
            } label: {
                Text("Sign Up")
                    .modifier(AuthActionButtonModifier())
            }
            
            Spacer()
            
            Divider()
            
            Button {
                
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
