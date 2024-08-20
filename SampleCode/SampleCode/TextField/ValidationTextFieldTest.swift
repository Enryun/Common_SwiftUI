//
//  ValidationTextFieldTest.swift
//  TestCommonUI
//
//  Created by James Thang on 08/06/2024.
//

import SwiftUI
import CommonSwiftUI

enum FocusableField {
    case firstName, lastName, address, password, confirmPassword
}

enum TextFieldError: LocalizedError {
    case weakPassword
    case invalidConfirmPassword
    
    var errorDescription: String? {
        switch self {
        case .weakPassword:
            return "Password has to be at least 6 characters"
        case .invalidConfirmPassword:
            return "Confirm Password do not match"
        }
    }
}

struct ValidationTextFieldTest: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var address = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @FocusState private var focus: FocusableField?
    
    @State private var isFormFirstNameValid = false
    @State private var isFormLastNameValid = false
    @State private var isPasswordValid = false
    @State private var isConfirmPasswordValid = false

    
    var body: some View {
        VStack(spacing: 15) {
            ValidationTextField(title: "First Name", text: $firstName, isValid: $isFormFirstNameValid)
                .autocorrectionDisabled()
                .focused($focus, equals: .firstName)
                .isMandatory(true)
            
            ValidationTextField(title: "Last Name", text: $lastName, isValid: $isFormLastNameValid)
                .focused($focus, equals: .lastName)
                .isMandatory(true)
                            
            ValidationTextField(title: "Address", text: $address)
                .clearButtonHidden(false)
                .focused($focus, equals: .address)
            
            ValidationTextField(title: "Password", text: $password, isValid: $isPasswordValid, isSecured: true)
                .focused($focus, equals: .password)
                .isMandatory(true)
                .secureTextButtonHidden(false)
                .autocorrectionDisabled()
                .onFormValidate { text in
                    // Check if text contains any letters (both uppercase and lowercase)
                    let atLeast6Char = text.count >= 6
                    // Check if text contains any numbers (decimal digit)
                    let containNumbers = text.rangeOfCharacter(from: .decimalDigits) != nil
                    // Check if text contains special characters "!@#%^&"
                    let containPunctuation = text.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#%^&")) != nil
                    
                    return [
                        .init(message: atLeast6Char ? "Password is at least 6 characters" : "Password need to be at least 6 characters", isValid: atLeast6Char),
                        .init(message: containNumbers ? "Password contains number" : "Password need to contain number", isValid: containNumbers),
                        .init(message: containNumbers ? "Password contains special character !@#%^&" : "Password need to contain special character !@#%^&", isValid: containPunctuation)
                    ]
                }
            
            ValidationTextField(title: "Confirm Password", text: $confirmPassword, isValid: $isConfirmPasswordValid, isSecured: true)
                .focused($focus, equals: .confirmPassword)
                .isMandatory(true)
                .onValidate { value in
                    value == password ? .success("Password Match") : .failure(TextFieldError.invalidConfirmPassword)
                }
                .onChange(of: password) { newValue in
                    if password != confirmPassword {
                        isConfirmPasswordValid = false
                        confirmPassword = ""
                    }
                }
                .secureTextButtonHidden(false)
                .autocorrectionDisabled()
            
            Spacer()
            
            Button("Creat New Account") {
                
            }
            .buttonStyle(.borderedProminent)
            .disabled(!(isFormFirstNameValid && isFormLastNameValid && isPasswordValid && isPasswordValid && isConfirmPasswordValid))
        }
        .padding()
    }
}

#Preview {
    ValidationTextFieldTest()
}
