//
//  ContentView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 20.01.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ContentViewModel()
    
    var body: some View {
        Group {
            if let userSession = vm.userSession {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
