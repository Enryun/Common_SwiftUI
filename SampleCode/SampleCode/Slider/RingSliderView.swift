//
//  RingSliderView.swift
//  TestCommonUI
//
//  Created by James Thang on 01/07/2024.
//

import SwiftUI
import CommonSwiftUI

struct RingSliderView: View {
    
    @State var startAngle: Angle = .degrees(50)
    @State var endAngle: Angle = .degrees(90)
    
    var body: some View {
        VStack(spacing: 50) {
            RingSlider(
                startAngle: $startAngle,
                toAngle: $endAngle,
                lineWidth: 40,
                tint: .purple,
                controlConfig: .init(width: 40, startSliderImage: Image(systemName: "moon.fill"),
                                     endSliderImage: Image(systemName: "alarm"))
            )
            .frame(width: 300, height: 300)
            
            Text("Start Angle: \(Int(startAngle.degrees)) - End Angle: \(Int(endAngle.degrees))")
        }
    }    
}

#Preview {
    RingSliderView()
}

extension View {
    func screenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
}


