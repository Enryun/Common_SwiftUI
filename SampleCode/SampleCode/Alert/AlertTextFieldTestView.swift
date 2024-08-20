//
//  AlertTextFieldTestView.swift
//  TestCommonUI
//
//  Created by James Thang on 31/03/2024.
//

import SwiftUI
import CommonSwiftUI

struct AlertTextFieldTestView: View {
    var body: some View {
        Button(action: {
            AlertWithTextFields(
                title: "Login",
                message: "Please enter your password",
                textFields: 
                    [
                        AlertTextField(placeholder: "username"),
                        AlertTextField(placeholder: "password", isSecureTextEntry: true)
                    ],
                actions:
                    [
                        AlertAction(title: "Cancel", style: .cancel) { result in
                            print(result)
                        },
                        AlertAction(title: "Login", style: .default) { result in
                            print(result)
                        }
                    ]
            )
        }, label: {
            Text("Present Alert")
        })
    }
}

#Preview {
    AlertTextFieldTestView()
}


