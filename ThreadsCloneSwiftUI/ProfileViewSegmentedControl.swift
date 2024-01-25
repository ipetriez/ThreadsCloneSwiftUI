//
//  ProfileViewSegmentedControl.swift
//  ThreadsCloneSwiftUI
//
//  Created by Sergey Petrosyan on 25.01.24.
//

import SwiftUI

enum Segment: Int, Identifiable, CaseIterable {
case threads, replies
    
    var id: Int { self.rawValue }
    
    var title: String {
        switch self {
        case .threads:
            "Threads"
        case .replies:
            "Replies"
        }
    }
}

struct ProfileViewSegmentedControl: View {
    @Binding var selectedSegment: Segment
    @Namespace private var animation
    
    private var segmentBarWidth: CGFloat {
        let segmentCount = CGFloat(Segment.allCases.count)
        let padding: CGFloat = 16
        return UIScreen.main.bounds.width / segmentCount - padding
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Segment.allCases) { segment in
                    VStack {
                        Text(segment.title)
                            .font (.subheadline)
                            .fontWeight(selectedSegment == segment ? .semibold : .regular)
                        
                        if selectedSegment == segment {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: segmentBarWidth, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: segmentBarWidth, height: 1)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring) {
                            selectedSegment = segment
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileViewSegmentedControl(selectedSegment: .constant(.threads))
}
