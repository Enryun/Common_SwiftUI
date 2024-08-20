//
//  GlassMorphismTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 28/03/2024.
//

import SwiftUI
import CommonSwiftUI

struct GlassMorphismTestView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.red)
            
            GlassMorphismView(cornerRadius: 25, blurRadius: 8, saturationAmount: 1.8)
            
            Text("CommonSwiftUI made by James Thang")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .multilineTextAlignment(.trailing)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding()
        }
        .frame(height: 250)
        .padding()
    }
}

#Preview {
    GlassMorphismTestView()
}

