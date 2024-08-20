//
//  AlertWrapperViewTest.swift
//  TestCommonUI
//
//  Created by James Thang on 24/03/2024.
//

import SwiftUI
import CommonSwiftUI

struct AlertWithErrorBindingTest: View {
    
    enum MyCustomAlert: Error, LocalizedError, CommonAlert {
        case noInternetConnection(onPress: () -> Void)
        case dataNotFound
        case urlError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .noInternetConnection:
                return "Please check your Internet connection and try again"
            case .dataNotFound:
                return "There is an error loading data. Please try again!"
            case .urlError(error: let error):
                return "Error calling \(error.localizedDescription)"
            }
        }
        
        var title: String {
            switch self {
            case .noInternetConnection:
                return "No Internet Connection"
            case .dataNotFound:
                return "Data not found"
            case .urlError(let error):
                return "Error \(error.localizedDescription)"
            }
        }
        
        var subTitle: String? {
            switch self {
            case .noInternetConnection:
                return "Please check your Internet connection and try again"
            case .dataNotFound:
                return "There is an error loading data. Please try again!"
            case .urlError(error: let error):
                return "Error calling \(error.localizedDescription)"
            }
        }
        
        var buttons: AnyView {
            AnyView(getButtonsForAlert())
        }
        
        @ViewBuilder
        func getButtonsForAlert() -> some View {
            switch self {
            case .noInternetConnection(onPress: let onPress):
                Button("OK") {
                    onPress()
                }
            case .dataNotFound:
                Button("RETRY") {
                    
                }
            case .urlError(let error):
                Button("DELETE", role: .destructive) {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    @State private var error: MyCustomAlert? = nil
    
    var body: some View {
        VStack(spacing: 35) {
            Button("No Internet Connection") {
                error = MyCustomAlert.noInternetConnection(onPress: {
                    print("On Pressed")
                })
            }
            .buttonStyle(.borderedProminent)
            
            Button("Data Not Found") {
                error = MyCustomAlert.dataNotFound
            }
            .buttonStyle(.borderedProminent)
            
            Button("URL Error") {
                error = MyCustomAlert.urlError(error: URLError(.badURL))
            }
            .buttonStyle(.borderedProminent)
        }
        .showCustomAlert(alert: $error)
    }
    
    func saveData() {
        let isSuccessful: Bool = false
        if isSuccessful {
            // do something
        } else {
            // Error
            let myError = MyCustomAlert.dataNotFound
            
            error = myError
        }
    }
}

#Preview {
    AlertWithErrorBindingTest()
}
