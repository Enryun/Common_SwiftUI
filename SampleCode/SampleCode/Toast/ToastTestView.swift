//
//  ToastTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 22/03/2024.
//

import SwiftUI
import CommonSwiftUI

struct ToastTestView: View {
    var body: some View {
        VStack(spacing: 25) {
            Button("Toast 1") {
                Toast.shared.present(
                    title: "Hello World",
                    symbol: "hand.wave",
                    tint: .blue,
                    isUserInteractionEnabled: true,
                    timing: .slow
                )
            }
            
            Button("Toast 2") {
                Toast.shared.present(
                    title: "I am James Thang",
                    symbol: "book.fill",
                    tint: .black,
                    isUserInteractionEnabled: true,
                    timing: .slow
                )
            }
            
            Button("Toast 3") {
                Toast.shared.present(
                    title: "This is CommonSwiftUI",
                    symbol: "lightbulb.circle.fill",
                    tint: .purple,
                    isUserInteractionEnabled: true,
                    timing: .slow
                )
            }
            
        }
        .padding()
    }
}

#Preview {
    RootView {
        ToastTestView()
    }
}
