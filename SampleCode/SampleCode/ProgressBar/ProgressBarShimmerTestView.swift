//
//  ProgressBarShimmerTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 27/08/2024.
//

import SwiftUI
import CommonSwiftUI

struct ProgressBarShimmerTestView: View {
    
    @State private var progress: CGFloat = 0.75
    
    var body: some View {
        VStack(spacing: 20) {
            ProgressBar(progress: $progress, color: .orange, backgroundColor: .orange.opacity(0.2), shimmer: true)
                .frame(width: 300, height: 20)
        }
    }
}

#Preview {
    ProgressBarShimmerTestView()
}

