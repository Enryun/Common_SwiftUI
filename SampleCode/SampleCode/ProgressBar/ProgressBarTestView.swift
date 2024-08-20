//
//  ProgressBarTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 17/03/2024.
//

import SwiftUI
import CommonSwiftUI

struct ProgressBarTestView: View {
    @State private var progress: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 20) {
            ProgressBar(progress: $progress, color: .green, backgroundColor: .clear)
                .frame(width: 300, height: 20)

            ProgressBar(progress: $progress, color: .orange, backgroundColor: .orange.opacity(0.2))
                .frame(width: 300, height: 20)

            ProgressBar(progress: $progress, colors: [.red, .blue])
                .frame(width: 300, height: 16)

            ProgressBar(progress: $progress, color: .blue)
                .frame(width: 300, height: 8)

            ProgressBar(progress: $progress, colors: [.indigo, .teal])
                .frame(width: 300, height: 8)

            HStack(spacing: 50) {
                RingProgress(progress: $progress, lineWidth: 16, startAngle: .degrees(90), color: .blue)
                    .frame(width: 150, height: 150)
                
                RingProgress(progress: $progress, lineWidth: 12, startAngle: .degrees(90), color: .red)
                    .frame(width: 80, height: 80)
            }

            HStack(spacing: 50) {
                RingProgress(progress: $progress, lineWidth: 16, startAngle: .degrees(90), colors: [.blue, .green])
                    .frame(width: 150, height: 150)
                
                RingProgress(progress: $progress, lineWidth: 8, startAngle: .degrees(90), colors: [.red, .green])
                    .frame(width: 50, height: 50)
            }

            HStack(spacing: 50) {
                ArcProgress(progress: $progress, lineWidth: 16, color: .red)
                    .frame(width: 150, height: 150)
                
                
                ArcProgress(progress: $progress, lineWidth: 10, color: .pink)
                    .frame(width: 50, height: 50)
            }

            HStack(spacing: 50) {
                ArcProgress(progress: $progress, lineWidth: 16, colors: [.orange, .yellow, .purple])
                    .frame(width: 150, height: 150)
                
                ArcProgress(progress: $progress, lineWidth: 10, colors: [.yellow, .blue])
                    .frame(width: 100, height: 100)
            }
        }
        .padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    progress = 0.25
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    progress = 0.5
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    progress = 0.75
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation {
                    progress = 1
                }
            }
        }
    }
}

#Preview {
    ProgressBarTestView()
}


