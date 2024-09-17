//
//  GlowTextTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 27/08/2024.
//

import SwiftUI
import CommonSwiftUI

struct GlowTextTestView: View {
    
    let gradient: LinearGradient = .linearGradient(.init(colors: [.blue, .purple, .orange]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        VStack {
            Image(systemName: "apple.logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .glow(gradient: gradient, intensity: 5)
            
            Text("It's Glowtime")
                .font(.system(size: 54))
                .fontWeight(.semibold)
                .glow(gradient: gradient, intensity: 5)
            
            Text("September 9, 2024")
        }
    }
    
}


#Preview {
    GlowTextTestView()
}




