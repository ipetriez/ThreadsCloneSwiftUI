//
//  ThreadsTabView.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 24.01.24.
//

import SwiftUI

struct ThreadsTabView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab,
                content:  {
            FeedView().tabItem { Image(systemName: selectedTab == 1 ? "house.fill" : "house")
                    .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
            }
            .onAppear { selectedTab = 1 }
            .tag(1)
            
            Text("Tab Content 2").tabItem { Image(systemName: "magnifyingglass") }
                .onAppear { selectedTab = 2 }
                .tag(2)
            
            Text("Tab Content 3").tabItem { Image(systemName: "plus") }
                .onAppear { selectedTab = 3 }
                .tag(3)
            
            Text("Tab Content 4").tabItem { Image(systemName: selectedTab == 4 ? "heart.fill" : "heart")
                    .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
            }
            .onAppear { selectedTab = 4 }
            .tag(4)
            
            Text("Tab Content 5").tabItem { Image(systemName: selectedTab == 5 ? "person.fill" : "person")
                    .environment(\.symbolVariants, selectedTab == 5 ? .fill : .none)
            }
            .onAppear { selectedTab = 5 }
            .tag(5)
            
        })
        .tint(.black)
    }
}

#Preview {
    ThreadsTabView()
}
