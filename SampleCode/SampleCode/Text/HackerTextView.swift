//
//  HackerTextView.swift
//  TestCommonUI
//
//  Created by James Thang on 01/06/2024.
//

import SwiftUI
import CommonSwiftUI

struct HackerTextView: View {
    @State private var trigger: Bool = false
    @State private var text = "Common SwiftUI"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HackerText(
                text: text,
                trigger: trigger,
                transition: .hyper,
                speed: .custom(0.06)
            )
            .font(.largeTitle.bold())
            .lineLimit(2)
            
            HackerText(
                text: text,
                trigger: trigger,
                transition: .numeric,
                speed: .custom(0.06)
            )
            .font(.largeTitle.bold())
            .lineLimit(2)
            
            Button(action: {
                if text == "Common SwiftUI" {
                    text = "Made with SwiftUI\nBy James Thang"
                } else {
                    text = "Common SwiftUI"
                }
                trigger.toggle()
            }, label: {
                Text("Trigger")
                    .fontWeight(.semibold)
                    
            })
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)
        }
        .padding(15)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HackerTextView()
}


