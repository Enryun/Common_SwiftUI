//
//  QRGeneratorTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 23/08/2024.
//

import SwiftUI
import CommonSwiftUI

struct QRGeneratorTestView: View {
    
    @State var uiImage: UIImage?
    
    var body: some View {
        VStack {
            QRGeneratorView(input: .url(URL(string: "https://www.linkedin.com/in/jamesthang/")!))
            
            QRGeneratorView(input: .string("CommonSwiftUI"))
            
            QRGeneratorView(input: .data(Data("James Thang".utf8)))
            
            if let uiImage {
                Image(uiImage: uiImage)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
            }
        }
        .onAppear(perform: {
            uiImage = QRCodeGenerator.generateQRCode(from: "https://github.com/Enryun/Common_SwiftUI")
//            uiImage = QRCodeGenerator.generateQRCode(from: URL(string: "https://www.linkedin.com/in/jamesthang/")!)
        })
    }
}

#Preview {
    QRGeneratorTestView()
}
