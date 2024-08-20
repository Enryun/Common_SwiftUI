//
//  LoadingButtonTest.swift
//  TestCommonUI
//
//  Created by James Thang on 03/06/2024.
//

import SwiftUI
import CommonSwiftUI

struct LoadingButtonTest: View {
    
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 25) {
            Button("Loading Button 1") {
                isLoading = true
                // Simulate a network request or some action
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = false
                }
            }
            .buttonStyle(LoadingButtonStyle(isLoading: $isLoading))
            
            Button("Loading Button 2") {}
                .buttonStyle(LoadingButtonStyle(isLoading: $isLoading, loadingState: .leading, backgroundColor: .cyan, horizontalPadding: 40))
            
            Button(action: {}, label: {
                Text("Loading Button 3")
                    .frame(width: 250, height: 40)
            })
            .buttonStyle(LoadingButtonStyle(isLoading: $isLoading, loadingState: .resize, backgroundColor: .indigo))
            
            Button(action: {}, label: {
                HStack(spacing: 12) {
                    Image(systemName: "person.crop.circle")
                        .font(.title2)
                    
                    Text("Loading Button 4")
                        .font(.title)
                }
                .frame(width: 250, height: 40)
            })
            .buttonStyle(LoadingButtonStyle(isLoading: $isLoading, loadingState: .leading, backgroundColor: .red, disabledLoadingColor: .red.opacity(0.5)))
            
            Button(action: {}, label: {
                Image(systemName: "heart.fill")
                    .font(.title)
                    .padding(5)
            })
            .buttonStyle(LoadingButtonStyle(isLoading: $isLoading, loadingState: .top, backgroundColor: .green, shape: .circle))
        }
        .padding()
    }
    
}

#Preview {
    LoadingButtonTest()
}


