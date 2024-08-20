//
//  QRScannerTest.swift
//  TestCommonUI
//
//  Created by James Thang on 24/03/2024.
//

import SwiftUI
import CommonSwiftUI

struct QRScannerTest: View {
    
    @State var isScanning: Bool = false
    @State var successResult: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text(successResult)
                .font(.title)
                .fontWeight(.semibold)
            
            QRScannerView(isScanning: $isScanning, showScanningAnimation: true, showErrorAlert: false) { result in
                switch result {
                case .success(let result):
                    successResult = result
                case .failure(let error):
                    print("This is Error Cases")
                    print(error)
                    print(error.localizedDescription)
                }
            }
        
            Button("Start Scanning") {
                successResult = ""
                isScanning = true
            }
            
            Button("Stop Scanning") {
                successResult = ""
                isScanning = false
            }
        }
    }
}
