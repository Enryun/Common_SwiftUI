//
//  GrowingButtonTest.swift
//  TestCommonUI
//
//  Created by James Thang on 16/06/2024.
//

import SwiftUI
import CommonSwiftUI

struct GrowingButtonTest: View {
    
    let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        VStack(spacing: 25) {
            Button("Growing 1") { }
                .buttonStyle(GrowingButtonStyle())
            
            Button("Growing 2") { }
                .buttonStyle(GrowingButtonStyle(textColor: .primary, backgroundColor: .green, shape: .rect(cornerRadius: 4)))
            
            Button("Growing 3") { }
                .buttonStyle(GrowingButtonStyle(textColor: .primary, backgroundColor: gradient, shape: .rect(cornerRadius: 4)))
        }
    }
}

#Preview {
    GrowingButtonTest()
}


