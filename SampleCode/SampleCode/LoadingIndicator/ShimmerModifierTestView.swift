//
//  ShimmerModifierTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 18/08/2024.
//

import SwiftUI
import CommonSwiftUI

struct ShimmerModifierTestView: View {
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 55, height: 55)
                
                VStack(alignment: .leading, spacing: 6) {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(height: 10)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .frame(height: 10)
                        .padding(.trailing, 50)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .frame(height: 10)
                        .padding(.trailing, 100)
                }
            }
            .padding(15)
            .padding(.horizontal, 30)
            .shimmer(tint: .gray.opacity(0.3), highlight: .white, blur: 5)
            
            Text("Loading...")
                .shimmer(tint: .gray.opacity(0.3), highlight: .white, blur: 5)
        }
    }
}

#Preview {
    ShimmerModifierTestView()
}
