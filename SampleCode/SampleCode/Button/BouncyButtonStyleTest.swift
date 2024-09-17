//
//  BouncyButtonStyleTest.swift
//  SampleCode
//
//  Created by James Thang on 17/09/2024.
//

import SwiftUI
import CommonSwiftUI

struct BouncyButtonStyleTest: View {
    var body: some View {
        VStack(spacing: 24) {
            Button("Cartoon Button") { }
                .buttonStyle(BouncyButtonStyle())
            
            Button("Cartoon Button") { }
                .buttonStyle(BouncyButtonStyle(shape: .rect(cornerRadius: 4)))
            
            Button(action: { }, label: {
                Image(systemName: "heart.fill")
                    .font(.title)
                    .padding(5)
            })
            .buttonStyle(BouncyButtonStyle(shape: .circle))
            
            Button("Cartoon Button") { }
                .buttonStyle(BouncyButtonStyle(textColor: .black,
                                                 pressedTextColor: .black,
                                                 backgroundColor: .green,
                                                 pressedBackgroundColor: .orange))
        }
    }
}

#Preview {
    BouncyButtonStyleTest()
}
