//
//  RangeSliderTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 01/06/2024.
//

import SwiftUI
import CommonSwiftUI

struct RangeSliderTestView: View {
    @State private var selection: ClosedRange<CGFloat> = 60...90
    @State private var selection2: ClosedRange<CGFloat> = 10...50

    
    var body: some View {
        VStack(spacing: 50) {
            RangeSlider(
                selection: $selection,
                range: 10...100,
                minimumDistance: 10,
                lineWidth: 15,
                tint: .red,
                controlConfig: .init(width: 20, enableShadow: true)
            )
            .frame(height: 100)
            
            Text("\(Int(selection.lowerBound)):\(Int(selection.upperBound))")
                .font(.largeTitle.bold())
                .padding(.top, 10)
            
            RangeSlider(
                selection: $selection2,
                range: 0...100,
                minimumDistance: 1,
                lineWidth: 8,
                tint: .green,
                controlConfig: .init(width: 12, enableShadow: true)
            )
            .frame(height: 100)
            
            Text("\(Int(selection2.lowerBound)):\(Int(selection2.upperBound))")
                .font(.largeTitle.bold())
                .padding(.top, 10)
        }
    }
}

#Preview {
    RangeSliderTestView()
}
