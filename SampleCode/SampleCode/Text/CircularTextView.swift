//
//  CircularTextView.swift
//  TestCommonUI
//
//  Created by James Thang on 31/05/2024.
//

import SwiftUI
import CommonSwiftUI

struct CircularTextView: View {
    var body: some View {
        VStack(spacing: 40) {
            ZStack {
                Circle()
                    .fill(.gray.opacity(0.3))
                
                CircularText(text: "#OPENTOWORK", radius: 150, spacing: 8, alignment: .outside, reverseStyle: false)
                    .font(.largeTitle.bold())
                    .lineSpacing(5)
            }
            .frame(width: 300, height: 300)
            
            ZStack {
                Circle()
                    .fill(.gray.opacity(0.3))
                
                CircularText(text: "#OPENTOWORK", radius: 150, spacing: 8, alignment: .inside, reverseStyle: true, textModifier: { text in
                    text.font(.largeTitle.bold())
                        .lineSpacing(5)
                })
                .rotationEffect(.degrees(-140))
            }
            .frame(width: 300, height: 300)
        }
    }
}

#Preview {
    CircularTextView()
}


//ZStack {
//    Circle()
//        .fill(.gray.opacity(0.3))
//    
//    Circle()
//        .stroke(lineWidth: 40)
//        .fill(LinearGradient(gradient: Gradient(colors: [
//            .clear, .clear, .clear, .clear, .clear, .clear, .pink, .pink.opacity(0.8), .pink, .clear]), startPoint: .topLeading, endPoint: .bottomTrailing))
//        .rotationEffect(.degrees(85))
//        .padding(20)
//    
//    CircularText(text: "#OPENTODATE", radius: 150, spacing: 8, alignment: .inside, reverseStyle: true)
//        .font(.largeTitle.bold())
//        .rotationEffect(.degrees(-140))
//        .lineSpacing(5)
//}
//.frame(width: 300, height: 300)
//
//ZStack {
//    Circle()
//        .fill(.gray.opacity(0.3))
//
//    Circle()
//        .stroke(lineWidth: 40)
//        .fill(LinearGradient(gradient: Gradient(colors: [
//            .clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .blue, .blue.opacity(0.8), .blue, .clear]), startPoint: .topLeading, endPoint: .bottomTrailing))
//        .rotationEffect(.degrees(85))
//        .padding(20)
//    
//    CircularText(text: "#LAYOFF", radius: 150, spacing: 8, alignment: .inside, reverseStyle: true, textModifier: { text in
//        text.font(.largeTitle.bold())
//            .lineSpacing(5)
//    })
//    .rotationEffect(.degrees(-140))
//}
