//
//  NeumorphismTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 22/03/2024.
//

import SwiftUI
import CommonSwiftUI

struct NeumorphismTestView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Neumorphism")
                .neumorphism(color: .gray.opacity(0.8))
            
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(.white)
                .neumorphism(color: .gray.opacity(0.5))
            
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 300, height: 200)
                .foregroundStyle(.white)
                .neumorphism(color: .indigo.opacity(0.5))
        }
    }
}

#Preview {
    NeumorphismTestView()
}


