//
//  HoldDownButtonTest.swift
//  TestCommonUI
//
//  Created by James Thang on 02/06/2024.
//

import SwiftUI
import CommonSwiftUI

struct HoldDownButtonTest: View {
    var body: some View {
        VStack(spacing: 24) {
            HoldDownButton(text: "Hold Down Button", color: .white, background: .black, loadingTint: .yellow, clipShape: .capsule) {
                print("Finish")
            }
            
            HoldDownButton(text: "Hold Down Button", loadingTint: .white, clipShape: .rect(cornerRadius: 8)) {
                print("Finish")
            }
            
            HoldDownButton(text: "Hold Down Button") {
                print("Finish")
            }
            
            HoldDownButton(
                text: "Press and Hold",
                paddingHorizontal: 24,
                paddingVertical: 12,
                duration: 2,
                scale: 0.95,
                color: .white,
                background: .blue,
                loadingTint: .green.opacity(0.5),
                clipShape: RoundedRectangle(cornerRadius: 10),
                action: {
                    print("Action triggered!")
                }
            )
        }
    }
}

#Preview {
    HoldDownButtonTest()
}

