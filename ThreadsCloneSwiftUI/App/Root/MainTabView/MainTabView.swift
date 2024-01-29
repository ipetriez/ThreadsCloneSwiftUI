//
//  ThreadsTabView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 24.01.24.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab = 1
    @State private var previouslySelectedTab = 1
    @State private var showNewThreadView = false
    
    var body: some View {
        TabView(selection: $selectedTab,
                content:  {
            FeedView()
                .tabItem { Image(systemName: selectedTab == 1 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            
            ExploreView()
                .tabItem { Image(systemName: "magnifyingglass") }
                .onAppear { selectedTab = 2 }
                .tag(2)
            
            Text("")
                .tabItem { Image(systemName: "plus") }
                .onAppear { selectedTab = 3 }
                .tag(3)
            
            Text("Tab Content 4")
                .tabItem { Image(systemName: selectedTab == 4 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear { selectedTab = 4 }
                .tag(4)
            
            CurrentUserProfileView()
                .tabItem { Image(systemName: selectedTab == 5 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 5 ? .fill : .none)
                }
                .onAppear { selectedTab = 5 }
                .tag(5)
        })
        .onChange(of: selectedTab, { oldValue, newValue in
            previouslySelectedTab = oldValue
            showNewThreadView = newValue == 3
        })
        .sheet(isPresented: $showNewThreadView, onDismiss: { selectedTab = previouslySelectedTab }, content: {
            NewThreadView()
        })
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
