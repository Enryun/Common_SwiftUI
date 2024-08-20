//
//  UniversalAlertTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 17/06/2024.
//

import SwiftUI
import CommonSwiftUI

struct UniversalAlertTestView: View {
    // View Properties
    @State private var alert: UniversalAlertConfig = UniversalAlertConfig(enableBackgroundBlur: true, disableOutsideTap: false, transitionType: .slide, slideEdge: .bottom)
    
    var body: some View {
        VStack {
            Button("Show Alert") {
                alert.present()
            }
            .buttonStyle(.borderedProminent)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.yellow)
        .onTapGesture {
            alert.dismiss()
        }
        .alert(alertConfig: $alert) {
            BottomSheetView(
                icon: "questionmark.circle.fill",
                title: "Replace Existing Folder?",
                message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                confirmText: "Replace",
                confirmAction: {
                    print("Confirm action")
                },
                cancelText: "Cancel",
                cancelAction: {
                    print("Cancel action")
                    alert.dismiss()
                }
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    RootView {
        UniversalAlertTestView()
    }
}


struct CustomAlertView: View {
    
    var title: String
    var message: String
    var confirmAction: () -> Void
    var cancelAction: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.headline)
                .padding(.top, 20)
            
            Text(message)
                .font(.subheadline)
                .padding(.horizontal, 20)
            
            Divider()
            
            HStack {
                Button(action: cancelAction) {
                    Text("Cancel")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                }
                .padding(.vertical, 10)
                
                Divider()
                
                Button(action: confirmAction) {
                    Text("OK")
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                }
                .padding(.vertical, 10)
            }
            .frame(height: 50)
        }
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding(.horizontal, 40)
    }
}

struct BottomSheetView: View {
    
    var icon: String
    var title: String
    var message: String
    var confirmText: String
    var confirmAction: () -> Void
    var cancelText: String
    var cancelAction: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundColor(.white)
                .background(Circle().fill(.blue))
            
            Text(title)
                .font(.headline)
                .padding(.top, 10)
            
            Text(message)
                .font(.subheadline)
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
            
            VStack(spacing: 12) {
                Button(action: confirmAction) {
                    Text(confirmText)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: cancelAction) {
                    Text(cancelText)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding(.horizontal, 30)
        .padding(.bottom, 40)
    }
}


