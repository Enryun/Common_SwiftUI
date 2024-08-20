//
//  ViewModifierTest.swift
//  TestCommonUI
//
//  Created by James Thang on 22/03/2024.
//

import SwiftUI
import CommonSwiftUI

struct ViewModifierTest: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Text("Hello World")
                    .apply {
                        if #available(iOS 16.0, *) {
                            $0.padding()
                        } else {
                            $0.padding().background(Color.gray)
                        }
                    }
                
                NavigationLink {
                    Text("Next View")
                } label: {
                    Text("Next View")
                        .font(.title)
                }
            }
            .onLoad {
                print("View Did Load")
            }
            .onAppear {
                print("View Appear")
            }
        }
    }
}

#Preview {
    ViewModifierTest()
}
