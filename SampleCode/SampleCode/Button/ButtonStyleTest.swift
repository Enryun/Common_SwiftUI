//
//  ButtonStyleTest.swift
//  TestCommonUI
//
//  Created by James Thang on 17/03/2024.
//

import SwiftUI
import CommonSwiftUI

struct ButtonStyleTestView: View {
    
    let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        VStack(spacing: 25) {
            Button("Capsule 1") { }
                .buttonStyle(CapsuleButtonStyle())

            Button("Capsule 2") { }
                .buttonStyle(CapsuleButtonStyle(textColor: .black, backgroundColor: .green))

            Button("Capsule 3") { }
                .buttonStyle(CapsuleButtonStyle(textColor: .white, backgroundColor: gradient))

            Button(action: { }, label: {
                HStack {
                    Image(systemName: "cloud.sun")
                    Text("Capsule 4")
                }
            })
            .buttonStyle(CapsuleButtonStyle(textColor: Color.white, backgroundColor: gradient))

            Button("ShapeButton 1") { }
                .buttonStyle(ShapeButtonStyle(textColor: .white, backgroundColor: .blue, shape: .rect))
            
            Button("ShapeButton 2") { }
                .buttonStyle(ShapeButtonStyle(textColor: .primary,
                                              backgroundColor: .green, shape: .rect(cornerRadius: 8)))
            
            Button("ShapeButton 3") { }
                .buttonStyle(ShapeButtonStyle(textColor: .white, backgroundColor: .red, shape: .capsule))
            
            Button("ShapeButton 4") { }
                .buttonStyle(ShapeButtonStyle(textColor: .white, backgroundColor: .orange, shape: .ellipse))

            Button(action: {
                
            }, label: {
                Image(systemName: "heart.fill")
                    .font(.title)
                    .padding(5)
            })
            .buttonStyle(ShapeButtonStyle(textColor: .white, backgroundColor: gradient, shape: .circle))
        }
    }
}

#Preview {
    ButtonStyleTestView()
}




