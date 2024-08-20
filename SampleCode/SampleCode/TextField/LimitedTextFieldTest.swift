//
//  LimitedTextFieldTest.swift
//  TestCommonUI
//
//  Created by James Thang on 02/06/2024.
//

import SwiftUI
import CommonSwiftUI

struct LimitedTextFieldTest: View {
    
    @State private var text: String = ""
    @State private var text2: String = ""
    
    var body: some View {
        VStack {
            LimitedTextField(
                config: .init(
                    limit: 40,
                    tint: .secondary,
                    autoResizes: true,
                    allowExcessTyping: false
                ),
                hint: "Type here",
                value: $text
            )
            .frame(maxHeight: 150)
                        
            LimitedTextField(
                config: .init(
                    limit: 40,
                    tint: .green,
                    autoResizes: true,
                    allowExcessTyping: true
                ),
                hint: "Type here",
                value: $text2
            )
            .frame(maxHeight: 150)
        }
        .padding()
    }
}

#Preview {
    LimitedTextFieldTest()
}
