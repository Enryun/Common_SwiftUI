//
//  ContentView.swift
//  SampleCode
//
//  Created by James Thang on 20/08/2024.
//

import SwiftUI
import CommonSwiftUI

struct ContentView: View {
    var body: some View {
        RootView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
