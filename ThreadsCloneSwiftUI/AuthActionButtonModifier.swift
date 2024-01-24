//
//  AuthActionButtonModifier.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 24.01.24.
//

import SwiftUI

struct AuthActionButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 352, height: 44)
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
