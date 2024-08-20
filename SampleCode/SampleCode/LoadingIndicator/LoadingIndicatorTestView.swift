//
//  LoadingIndicatorTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 17/03/2024.
//

import SwiftUI
import CommonSwiftUI

struct LoadingIndicatorTestView: View {
    
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            HStack {
                SimpleLoadingIndicator(loadingSpeed: .fast)
                    .frame(width: 100, height: 100)
                    .opacity(isLoading ? 1 : 0)
                
                SimpleLoadingIndicator(loadingSpeed: .medium)
                    .frame(width: 100, height: 100)
                    .opacity(isLoading ? 1 : 0)
                
                SimpleLoadingIndicator(loadingSpeed: .slow)
                    .frame(width: 100, height: 100)
                    .opacity(isLoading ? 1 : 0)
            }


            SimpleLoadingIndicator(color: .red, backgroundColor: .clear, lineWidth: 12)
                .frame(width: 200, height: 200)
                .opacity(isLoading ? 1 : 0)


            SimpleLoadingIndicator(color: .red, backgroundColor: .clear, lineWidth: 12, loadingSpeed: .custom(5))
                .frame(width: 200, height: 200)
                .opacity(isLoading ? 1 : 0)

            Button(action: { isLoading.toggle() }, label: {
                Text("Toggle Loading")
                    .font(.title)
            })
        }
    }
}

#Preview {
    LoadingIndicatorTestView()
}




