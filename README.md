
# CommonSwiftUI

![iOS 15.0+](https://img.shields.io/badge/iOS-15.0%2B-blue.svg)
[![Pod Version](http://img.shields.io/cocoapods/v/SDWebImage.svg?style=flat)](https://cocoapods.org/pods/Tutorials)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://mit-license.org)

## Table of Contents
1. [Overview](#overview)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Components](#components)
5. [Author](#author)

## Overview

## Requirements

| Platform | Minimum Version |
|----------|-----------------|
| iOS      | 15.0            |

## Installation
This project can be installed using `Swift Package Manager` and `CocoaPod`.

### Swift Package Manager

1. Open your project in Xcode.
2. Navigate to `File` > `Swift Packages` > `Add Package Dependency`.
3. Paste the repository URL: `https://github.com/Enryun/Common_SwiftUI`
4. Follow the prompts to add the package to your project.

For more details on using Swift Package Manager, visit [Apple's Swift Package Manager documentation](https://swift.org/package-manager/).

### Importing the Library

To use any of the components provided by `CommonSwiftUI`, such as `RangeSlider` or `QRScannerView`, you need to import the library at the beginning of your SwiftUI view file. This ensures that all the features and components from the library are accessible in that file. Simply add the following line at the top of your `.swift` file where you plan to use these components:

```swift
import CommonSwiftUI
```

## Components

- [Alert](#alert)
   - [AlertWithTextFields](#alertwithtextFields)
   - [AlertWithErrorBinding](#alertwitherrorbinding)
   - [UniversalAlert](#universalalert)
- [Button](#button)
   - [CapsuleButtonStyle](#capsulebuttonstyle)
   - [ShapeButtonStyle](#shapebuttonstyle)
   - [GrowingButtonStyle](#growingbuttonstyle)
   - [LoadingButtonStyle](#loadingbuttonstyle)
- [Dropdown](#dropdown)
- [FloatingButton](#floatingbutton)
   - [ArcFloatingButton](#arcfloatingbutton)
   - [ExpandFloatButton](#expandfloatbutton)
- [HoldDownButton](#holddownbutton)
- [LoadingIndicator](#loadingindicator)
   - [SimpleLoadingIndicator](#simpleloadingindicator)
   - [FancyLoadingView](#fancyloadingview)
   - [ShimmerView](#shimmerview)
- [ProgressView](#progressview)
   - [ProgressBar](#progressbar)
   - [RingProgress](#ringprogress)
   - [ArcProgress](#arcprogress)
- [QRScanner](#qrscanner)
- [SegmentControl](#segmentcontrol)
- [Slider](#slider)
   - [RangeSlider](#rangeslider)
   - [RingSlider](#ringslider)
- [Text](#text)
   - [CircularText](#circulartext)
   - [HackerText](#hackertext)
   - [TypeWriterText](#typewritertext)
- [TextField](#textfield)
    - [LimitedTextField](#limitedtextfield)
    - [ValidationTextField](#validationtextfield)
- [Toast](#toast)
- [ViewModifier](#viewmodifier)
  - [ViewDidLoad](#viewdidload)
  - [VersionCondition](#versioncondition)

## Alert

## AlertWithTextFields:

Presents an alert with customizable text fields and actions.

This function creates and displays an `UIAlertController` with a specified title and message, incorporating any number of customizable text fields and actions into `SwiftUI`. Each text field can be tailored with specific attributes like placeholders and keyboard types, while actions can define their title, style, and a completion handler that processes the entered text.

Parameters:
- `title`: The title of the alert.
- `message`: The message displayed in the alert.
- `textFields`: An array of [AlertTextField](#alerttextfield), configuring each text field within the alert.
- `actions`: An array of [AlertAction](#alertaction), representing the actions that can be taken from the alert.

#### AlertTextField: 

Represents a configurable text field for use within an alert dialog.

This structure allows for the creation of a text field with customizable properties such as placeholder text, keyboard type, secure text entry for passwords, and text capitalization behavior. It can be used to gather input from users in a variety of contexts, ensuring that the text field is tailored to the specific type of data being requested.

Parameters:
- `placeholder`: A `String` that appears in the text field when it's empty, hinting at the expected input.
- `keyboardType`: The type of keyboard to display. Defaults to `.default`.
- `isSecureTextEntry`: A `Bool` indicating whether the text field is for secure text entry (e.g., passwords). Defaults to `false`.
- `autocapitalizationType`: The autocapitalization strategy for the text field. Defaults to `.none`.

#### AlertAction: 

Defines an action for an alert dialog.

This structure encapsulates the information needed to present an action within an alert, including the action's title, its visual style, and a completion handler that executes when the action is selected. The completion handler passes back an array of strings, allowing for flexible use cases such as returning input from text fields within the alert.

Parameters:
- `title`: The text to display on the action button.
- `style`: The visual style of the action, defined by `UIAlertAction.Style`.
- `completion`: A closure that is called when the action is selected, passing an array of `String` as its parameter.

Example:

```swift
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
```

https://github.com/user-attachments/assets/319d44d0-4d6d-4314-a14e-351c9c8014e7

This setup presents an alert for login, with text fields for username and password and options to cancel or log in.

## AlertWithErrorBinding:

This solution presents a customizable alert whenever the `Binding` error data has value. The error must conform to the provided [CommonAlert](#commonalert) protocol.

#### CommonAlert:

This `protocol` standardizes the way alerts are created by specifying essential elements that each alert should contain. Conforming to this `protocol` ensures consistency in alert presentation and functionality.

Properties:
- `title`: The primary text displayed in the alert, typically used for summarizing the alert's purpose.
- `subTitle`: An optional secondary text providing additional details or context.
- `buttons`: A view component representing the actionable items or responses available for the alert.

This function displays an alert based on the properties defined in an instance of `T`, where `T` conforms to the `CommonAlert` protocol. It allows for dynamic alert content including title, subtitle, and custom button actions.

```swift
public func showCustomAlert<T>(alert: Binding<T?>) -> some View where T : CommonSwiftUI.CommonAlert
```

Parameter:
- `alert`: A binding to an optional `CommonAlert` conforming object that provides the data for the alert.

Example:

Define Custom Error conforming to `CommonAlert` protocol. This standardizes and concentrates the way alerts are created and managed by specifying essential elements that each alert should contain.

```swift
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
```

Now Alert will show whenever the error is set:

```swift
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
```

https://github.com/user-attachments/assets/40021753-997a-40fc-a9a9-3570a5b03492

Adopting the `CommonAlert` component helps projects by standardizing alert presentations across an application, ensuring a consistent user interface. This consistency can reduce development time and errors by providing a unified method for creating and managing alerts. 

By conforming to the `CommonAlert` protocol, developers can customize alert components while maintaining a coherent appearance and functionality. This modularity and consistency in design make the component particularly useful in large projects or those requiring frequent alert updates.

## UniversalAlert

#### RootView

A view container that serves as the root of a view hierarchy and can display an overlay window.

`RootView` is designed to embed any SwiftUI view and has the capability to present additional content in an overlay window on top of the existing UI. This is particularly useful for displaying elements like toasts or alerts that should float above all other content.

Parameters:
- `content`: A closure returning the content of the view.

On appear, `RootView` automatically checks for an existing overlay window and, if none is found, creates and displays a new one, allowing for content like `Toast` or `Alert` to be shown on top of the primary view hierarchy.

## Button

## CapsuleButtonStyle:

A `ButtonStyle` for SwiftUI that applies a Capsule Shape with customizable color styles.

Parameters:
- `textColor`: The color or style applied to the text inside the button. Defaults to `.white`.
- `backgroundColor`: The background color or style of the button, conforming to `ShapeStyle`. Defaults to `.blue`.
- `verticalPadding`: The vertical padding inside the button. Defaults to `10`.
- `horizontalPadding`: The horizontal padding inside the button. Defaults to `20`.

Example:

```swift
let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)

var body: some View {
    VStack(spacing: 25) {
        Button("Capsule 1") { }
            .buttonStyle(CapsuleButtonStyle())
    
        Button("Capsule 2") { }
            .buttonStyle(CapsuleButtonStyle(textColor: .black, backgroundColor: .green))
    
        Button("Capsule 3") { }
            .buttonStyle(CapsuleButtonStyle(textColor: .white, backgroundColor: gradient))
    
        Button(action: {}, label: {
            HStack {
                Image(systemName: "cloud.sun")
                Text("Capsule 4")
            }
        })
        .buttonStyle(CapsuleButtonStyle(textColor: Color.white, backgroundColor: gradient))
    }
}
```

<img src="https://github.com/user-attachments/assets/89fcae09-da1b-4470-96b1-b01bd75a692f" width="220">

This style gives buttons a modern, rounded look suitable for various UI contexts.

## ShapeButtonStyle:

A `ButtonStyle` for SwiftUI that allows customization of the button's shape and color.

Parameters:
- `textColor`: The color or style applied to the text inside the button. Default is `.primary`.
- `backgroundColor`: The background color or style of the button, conforming to `ShapeStyle`. Default is `.secondary`.
- `shape`: The custom shape for the button, conforming to `Shape`. The default shape is `Capsule()`.
- `verticalPadding`: The vertical padding inside the button. Defaults to `10`.
- `horizontalPadding`: The horizontal padding inside the button. Defaults to `20`.

Example:

```swift
let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)

var body: some View {
    VStack(spacing: 25) {
        Button("ShapeButton 1") { }
            .buttonStyle(ShapeButtonStyle(textColor: .white, backgroundColor: .blue, shape: .rect))
    
        Button("ShapeButton 2") { }
            .buttonStyle(ShapeButtonStyle(textColor: .primary, backgroundColor: .green, shape: .rect(cornerRadius: 8)))
    
        Button("ShapeButton 3") { }
            .buttonStyle(ShapeButtonStyle(textColor: .white, backgroundColor: .red, shape: .capsule))
                
        Button("ShapeButton 4") { }
            .buttonStyle(ShapeButtonStyle(textColor: .white, backgroundColor: .orange, shape: .ellipse))
    
        Button(action: {}, label: {
            Image(systemName: "heart.fill")
                .font(.title)
                .padding(5)
            })
            .buttonStyle(ShapeButtonStyle(textColor: .white, backgroundColor: gradient, shape: .circle))
    }
}
```

<img src="https://github.com/user-attachments/assets/bd90bcd0-3510-4796-903e-4f78ac4b12c3" width="220">

This style modifies the appearance of buttons to fit within a specified shape, with customizable foreground, background colors and padding. It is highly flexible, accommodating various shapes and color styles.

## GrowingButtonStyle:

A `ButtonStyle` for SwiftUI that scales the button on press, with customizable shape and color styles.

Parameters:
- `textColor`: The color or style for the text inside the button, defaulting to `.white`.
- `backgroundColor`: The background color or style of the button, conforming to `ShapeStyle`, with a default of `.blue`.
- `shape`: The custom shape for the button, conforming to `Shape`. The default shape is `Capsule()`.
- `verticalPadding`: The vertical padding inside the button. Defaults to `10`.
- `horizontalPadding`: The horizontal padding inside the button. Defaults to `20`.

Example:

```swift
let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)

var body: some View {
    VStack(spacing: 25) {
        Button("Growing 1") { }
            .buttonStyle(GrowingButtonStyle())
        
        Button("Growing 2") { }
            .buttonStyle(GrowingButtonStyle(textColor: .primary, backgroundColor: .green, shape: .rect(cornerRadius: 4)))
        
        Button("Growing 3") { }
            .buttonStyle(GrowingButtonStyle(textColor: .primary, backgroundColor: gradient, shape: .rect(cornerRadius: 4)))
    }
}
```

https://github.com/user-attachments/assets/9520da94-8b87-4a84-83e9-da7b79dbaeab

This button style provides an interactive feedback effect by increasing the button's scale when pressed. It allows for customization of the button's foreground and background colors, shape, and padding.

## LoadingButtonStyle:

A `ButtonStyle` for SwiftUI that provides a customizable button with a loading indicator.

Parameters:
- `isLoading`: A binding to a boolean indicating whether the button is in a loading state.
- `loadingState`: An enum that determines the button's behavior when loading. Defaults to `.center`.
- `textColor`: The color or style for the text inside the button, defaulting to `.white`.
- `backgroundColor`: The background color or style of the button, conforming to `ShapeStyle`, with a default of `.blue`.
- `disabledLoadingColor`: The background color or style of the button when it is loading, conforming to `ShapeStyle`, with a default of `.gray`.
- `shape`: The custom shape for the button, conforming to `Shape`. The default shape is `Capsule()`.
- `verticalPadding`: The vertical padding inside the button. Defaults to `10`.
- `horizontalPadding`: The horizontal padding inside the button. Defaults to `20`.

Example:

```swift
@State private var isLoading: Bool = false

var body: some View {
    VStack(spacing: 25) {
        Button("Loading Button 1") {
            isLoading = true
            // Simulate a network request or some action
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = false
            }
        }.buttonStyle(LoadingButtonStyle(isLoading: $isLoading))
        
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
}
```

https://github.com/user-attachments/assets/b6fa0b46-53dc-4f81-bc84-fd467c74e407

This button style offers interactive feedback by displaying a `ProgressView` when in a loading state. It allows for extensive customization of the button's appearance, including text color, background color, shape, padding, and the position of the loading indicator. When loading, the button can optionally gray out the background and disable user interactions.

## Dropdown

A flexible and customizable dropdown component for SwiftUI. This view allows for displaying a list of selectable items with customizable appearance and interactivity.

This component offers flexibility in appearance and behavior, supporting dynamic content adjustments based on user selections. It provides customization options for row height, and allows for an optional placeholder view.

Parameters:
- `options`: An array of `Item`, representing the content of the dropdown. Conform to `Hashable`.
- `selection`: A binding to the currently selected item of type `Item`.
- `rowHeight`: Height of each dropdown row.
- `displayItem`: A closure that provides a view for each item. It receives four parameters: `item`: The current item to display, `isSelected`: A Boolean that indicates if the item is currently selected, `isPlaceHolderShow`: A Boolean that indicates if the placeholder is currently shown, and `isExpand`: A Boolean that indicates if the dropdown is expanded.
- `placeHolder`: An optional closure that returns a view used as the dropdown's placeholder. It receives a Boolean parameter indicating if the dropdown is expanded.

Example 1:

```swift
private var options: [String] = ["Option 1", "Option 2", "Option 3", "Option 4"]
@State private var selectedOption: String = "Option 1"

var body: some View {
    VStack {
        DropDown(options: options, selection: $selectedOption) { item, isSelected, isPlaceHolderShow, isExpand in
            Text(item)
                .foregroundStyle(isSelected ? .black : .white)
                .font(.title3)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.horizontal)
                .background {
                    Rectangle()
                        .fill(isSelected ? .green : .gray)
                }
        }
    
        Spacer()
    }
}
```

https://github.com/user-attachments/assets/286a2aee-e194-405e-abd7-963fe12dbaf6

Example 2:

```swift
private var options: [String] = ["Option 1", "Option 2", "Option 3", "Option 4"]
@State private var selectedOption: String = "Option 1"

var body: some View {
    VStack {
        DropDown(options: options, selection: $selectedOption4, rowHeight: 68) { item, isSelected, isPlaceHolderShow, isExpand in
            Text(item)
                .foregroundStyle(.black)
                .font(.title3)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(isSelected ? .green : .gray, lineWidth: 2)
                        .padding(2)
                }
                .padding(.top, 8)
        }
    
        Spacer()
    }
}
```

https://github.com/user-attachments/assets/1c3b267c-5fea-45e6-b611-0ab26a763fbc

Example 3:

```swift
enum DropDownOptions: String, CaseIterable {
        case north = "North"
        case south = "South"
        case east = "East"
        case west = "West"
}
@State private var selectedOption: DropDownOptions = .east

var body: some View {
    VStack {
        DropDown(options: DropDownOptions.allCases, selection: $selectedOption, rowHeight: 60) { item, isSelected, isPlaceHolderShow, isExpand in
            Text(item.rawValue)
                .foregroundStyle(isSelected && !isPlaceHolderShow ? .blue : .gray)
                .font(.title3)
        } placeHolder: {_ in
            Text("Select an option")
                .foregroundStyle(.gray)
                .font(.title3)
        }
    
        Spacer()
    }
}
```

https://github.com/user-attachments/assets/7c85934a-fc12-4ab2-8049-68783b2a14ef

Example 4:

```swift
enum DropDownOptions: String, CaseIterable {
        case north = "North"
        case south = "South"
        case east = "East"
        case west = "West"
}
@State private var selectedOption: DropDownOptions = .east

var body: some View {
    VStack {
        DropDown(options: DropDownOptions.allCases, selection: $selectedOption) { item, isSelected, isPlaceHolderShow, isExpand in
            Text(item.rawValue)
                .foregroundStyle(.black)
                .font(.title3)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.horizontal)
                .background {
                    Rectangle()
                        .fill(isSelected && !isPlaceHolderShow ? .clear : .gray.opacity(0.5))
                }
        } placeHolder: { isExpand in
            HStack {
                Text("Select the Direction")
                    .foregroundStyle(.primary)
                    .font(.title3)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .rotationEffect(isExpand ? .degrees(90) : .zero)
            }
        }
    
        Spacer()
    }
}
```

https://github.com/user-attachments/assets/bba43eb8-1d4f-4d22-98d3-2c950dd0000c

Use multiple DropDowns for complicated form:

https://github.com/user-attachments/assets/7f7b988e-8cc7-41f1-84e1-fe08f9f8ce22

This example demonstrates a `DropDown` menu utilizing an enumeration for options, showcasing custom text styling and a placeholder. Be creative with these options for your style.

## FloatingButton

## ArcFloatingButton

A customizable floating action button component that arcs around a main button, revealing multiple action buttons.

Parameters:
- `buttonSize`: The diameter of each action button.
- `alignment`: The alignment dictates the starting point and direction in which the action buttons will arc (e.g., topLeading, fullmoon).
- `spacing`: The spacing between the expanded action buttons.
- `shape`: The shape of each action button, conforming to the `Shape` protocol.
- `actions`: An array of [FloatingAction](#floatingaction) objects defining the actions for the expanded buttons.
- `label`: A view builder that generates the content displayed on the expandable floating button.

`ArcFloatingButton` allows for a radial or semi-circular placement of action buttons that emerge from behind the main button. It supports various alignments and can adapt to custom shapes for each action button.

#### FloatingAction

Represents a customizable floating action button with identifiable properties. Used for `ArcFloatingButton` and `ExpandFloatingButton`.

Parameters:
- `id`: A unique identifier for the button, useful for distinguishing multiple instances.
- `image`: The SwiftUI `Image` to display on the button.
- `font`: The font style for any textual content inside the button.
- `tint`: The color of the button's content, typically the icon or text.
- `background`: The background color of the button.
- `action`: The closure that executes when the button is tapped.

`FloatingAction` configures a button that can be prominently displayed over content, commonly used for actions such as creating new items or triggering specific functions. This struct allows customization of the button's icon, font, colors, and action.

Define actions data using [FloatingAction](#floatingaction):

```swift
private let actions = [
    FloatingAction(image: Image(systemName: "tray.full.fill"), tint: .red, background: .white) {
        print("Tray")
    },
    FloatingAction(image: Image(systemName: "lasso.badge.sparkles"), tint: .red, background: .white) {
        print("Spark")
    },
    FloatingAction(image: Image(systemName: "square.and.arrow.up.fill"), tint: .red, background: .white) {
        print("Share")
    }
]
```

**Top Leading**:

```swift
ScrollView(.vertical) { ... }
.overlay(alignment: .topLeading) {
    ArcFloatingButton(alignment: .topLeading, actions: actions) { isExpanded in
        Image(systemName: "plus")
            .font(.title3.bold())
            .foregroundStyle(.white)
            .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
            .scaleEffect(1.02)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black, in: .circle)
            // Scaling Effect when expanded
            .scaleEffect(isExpanded ? 0.9 : 1)
    }
    .padding()
}
```

https://github.com/user-attachments/assets/c8b47675-14ac-4c84-9354-dfa937919bcc

**Top Trailing**:

```swift
ScrollView(.vertical) { ... }
.overlay(alignment: .topTrailing) {
    ArcFloatingButton(alignment: .topTrailing, actions: actions) { isExpanded in
        Image(systemName: "plus")
            .font(.title3.bold())
            .foregroundStyle(.white)
            .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
            .scaleEffect(1.02)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black, in: .circle)
            // Scaling Effect when expanded
            .scaleEffect(isExpanded ? 0.9 : 1)
    }
    .padding()
}
```

https://github.com/user-attachments/assets/43e79578-d942-4d12-a34f-962539e648b8

**Bottom Leading**:

```swift
ScrollView(.vertical) { ... }
.overlay(alignment: .bottomLeading) {
    ArcFloatingButton(alignment: .bottomLeading, actions: actions) { isExpanded in
        Image(systemName: "plus")
            .font(.title3.bold())
            .foregroundStyle(.white)
            .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
            .scaleEffect(1.02)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black, in: .circle)
            // Scaling Effect when expanded
            .scaleEffect(isExpanded ? 0.9 : 1)
    }
    .padding()
}
```

https://github.com/user-attachments/assets/d1fbddf2-007d-452a-bd59-c39bc8208beb

**Bottom Trailing**:

```swift
ScrollView(.vertical) { ... }
.overlay(alignment: .bottomTrailing) {
    ArcFloatingButton(alignment: .bottomTrailing, actions: actions) { isExpanded in
        Image(systemName: "plus")
            .font(.title3.bold())
            .foregroundStyle(.white)
            .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
            .scaleEffect(1.02)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black, in: .circle)
            // Scaling Effect when expanded
            .scaleEffect(isExpanded ? 0.9 : 1)
    }
    .padding()
}
```

https://github.com/user-attachments/assets/27fe45f8-1bdf-461d-83de-c9abcbc626ca

Alternatively, [FloatingAction](#floatingaction) actions can be listed orderly inside the `action closure`.

**Halfmoon Top**:

```swift
.overlay(alignment: .center) {
    VStack {
        ArcFloatingButton(alignment: .halfmoonTop) {
            FloatingAction(image: Image(systemName: "tray.full.fill"), tint: .teal) {
                print("Tray")
            }
            
            FloatingAction(image: Image(systemName: "lasso.badge.sparkles"), tint: .teal) {
                print("Spark")
            }
            
            FloatingAction(image: Image(systemName: "square.and.arrow.up.fill"), tint: .teal) {
                print("Share")
            }
            
            FloatingAction(image: Image(systemName: "heart.fill"), tint: .teal) {
                print("Heart")
            }
            
            FloatingAction(image: Image(systemName: "house.fill"), tint: .teal) {
                print("Heart")
            }
        } label: { isExpanded in
            Image(systemName: "plus")
                .font(.title3.bold())
                .foregroundStyle(.white)
                .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                .scaleEffect(1.02)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black, in: .circle)
            // Scaling Effect when expanded
                .scaleEffect(isExpanded ? 0.9 : 1)
        }
    }
}
```

https://github.com/user-attachments/assets/b1397d03-83a0-4c3f-9b74-f4742c156145

**Halfmoon Bottom**:

```swift
.overlay(alignment: .center) {
    VStack {
        ArcFloatingButton(alignment: .halfmoonBottom) {
            FloatingAction(image: Image(systemName: "tray.full.fill"), tint: .orange) {
                print("Tray")
            }
            
            FloatingAction(image: Image(systemName: "lasso.badge.sparkles"), tint: .orange) {
                print("Spark")
            }
            
            FloatingAction(image: Image(systemName: "square.and.arrow.up.fill"), tint: .orange) {
                print("Share")
            }
            
            FloatingAction(image: Image(systemName: "heart.fill"), tint: .orange) {
                print("Heart")
            }
            
            FloatingAction(image: Image(systemName: "house.fill"), tint: .orange) {
                print("Heart")
            }
        } label: { isExpanded in
            Image(systemName: "plus")
                .font(.title3.bold())
                .foregroundStyle(.white)
                .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
                .scaleEffect(1.02)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black, in: .circle)
                // Scaling Effect when expanded
                .scaleEffect(isExpanded ? 0.9 : 1)
        }
    }
}
```

https://github.com/user-attachments/assets/89260d78-8e96-47fb-ac52-7dc2ee190ad7

**Halfmoon Leading**:

```swift
.overlay(alignment: .center) {
    ArcFloatingButton(alignment: .halfmoonLeading) {
        FloatingAction(image: Image(systemName: "tray.full.fill"), tint: .yellow) {
            print("Tray")
        }
        
        FloatingAction(image: Image(systemName: "lasso.badge.sparkles"), tint: .yellow) {
            print("Spark")
        }
        
        FloatingAction(image: Image(systemName: "square.and.arrow.up.fill"), tint: .yellow) {
            print("Share")
        }
        
        FloatingAction(image: Image(systemName: "heart.fill"), tint: .yellow) {
            print("Heart")
        }
        
        FloatingAction(image: Image(systemName: "house.fill"), tint: .yellow) {
            print("Heart")
        }
    } label: { isExpanded in
        Image(systemName: "plus")
            .font(.title3.bold())
            .foregroundStyle(.white)
            .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
            .scaleEffect(1.02)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black, in: .circle)
            // Scaling Effect when expanded
            .scaleEffect(isExpanded ? 0.9 : 1)
    }
}
```

https://github.com/user-attachments/assets/64c47986-40a3-466b-9b54-079fc67d0e65

**Halfmoon Trailing**:

```swift
.overlay(alignment: .center) {
    ArcFloatingButton(alignment: .halfmoonTrailing) {
        FloatingAction(image: Image(systemName: "tray.full.fill"), tint: .green) {
            print("Tray")
        }
        
        FloatingAction(image: Image(systemName: "lasso.badge.sparkles"), tint: .green) {
            print("Spark")
        }
        
        FloatingAction(image: Image(systemName: "square.and.arrow.up.fill"), tint: .green) {
            print("Share")
        }
        
        FloatingAction(image: Image(systemName: "heart.fill"), tint: .green) {
            print("Heart")
        }
        
        FloatingAction(image: Image(systemName: "house.fill"), tint: .green) {
            print("Heart")
        }
    } label: { isExpanded in
        Image(systemName: "plus")
            .font(.title3.bold())
            .foregroundStyle(.white)
            .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
            .scaleEffect(1.02)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black, in: .circle)
            // Scaling Effect when expanded
            .scaleEffect(isExpanded ? 0.9 : 1)
    }
}
```

https://github.com/user-attachments/assets/311239dd-8353-48cb-87b1-5b9fe6f17056

**FullMoon**:

```swift
.overlay(alignment: .center) {
    ArcFloatingButton(alignment: .fullmoon) {
        FloatingAction(image: Image(systemName: "tray.full.fill"), tint: .red) {
            print("Tray")
        }
        
        FloatingAction(image: Image(systemName: "lasso.badge.sparkles"), tint: .orange) {
            print("Spark")
        }
        
        FloatingAction(image: Image(systemName: "square.and.arrow.up.fill"), tint: .yellow) {
            print("Share")
        }
        
        FloatingAction(image: Image(systemName: "heart.fill"), tint: .green) {
            print("Heart")
        }
        
        FloatingAction(image: Image(systemName: "house.fill"), tint: .blue) {
            print("Heart")
        }
        
        FloatingAction(image: Image(systemName: "paperplane"), tint: .cyan) {
            print("Heart")
        }
    } label: { isExpanded in
        Image(systemName: "plus")
            .font(.title3.bold())
            .foregroundStyle(.white)
            .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
            .scaleEffect(1.02)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black, in: .circle)
            // Scaling Effect when expanded
            .scaleEffect(isExpanded ? 0.9 : 1)
    }
}
```

https://github.com/user-attachments/assets/a5c087e0-80f0-4b6e-a382-bcb0adf2919d

This component enhances the user interface by seamlessly integrating multiple actions into a single floating action button, providing both aesthetic appeal and functional space-saving benefits.

This component is ideal for interfaces that require quick access to multiple actions without cluttering the UI.

## ExpandFloatButton

A SwiftUI view component that displays a floating action button with expandable action buttons.

Parameters:
- `buttonSize`: The size of the floating button and each action button.
- `alignment`: The direction in which the action buttons will expand from the main button. (e.g., leading, trailing, top, bottom).
- `spacing`: The space between the expanded action buttons.
- `shape`: The shape of each action button, conforming to the `Shape` protocol.
- `actions`: An array of [FloatingAction](#floatingaction) objects defining the actions for the expanded buttons.
- `label`: A view builder that generates the content displayed on the expandable floating button.

`ExpandFloatButton` offers a dynamic way to present multiple action buttons from a main floating button. It supports expansion in specified directions and can adapt the shape of the action buttons.

Define actions data using [FloatingAction](#floatingaction):

```swift
private let actions: [FloatingAction] = [
    FloatingAction(image: Image(systemName: "tray.full.fill"), tint: .red) {
        print("Tray")
    },
    FloatingAction(image: Image(systemName: "lasso.badge.sparkles"), tint: .orange) {
        print("Spark")
    },
    FloatingAction(image: Image(systemName: "square.and.arrow.up.fill"), tint: .yellow) {
        print("Share")
    },
    FloatingAction(image: Image(systemName: "heart.fill"), tint: .green) {
        print("Heart")
    },
    FloatingAction(image: Image(systemName: "paperplane"), tint: .cyan) {
        print("Plane")
    }
]
```

**Leading**:

```swift
ScrollView(.vertical) { ... }
.overlay(alignment: .bottomLeading) {
    ExpandFloatButton(alignment: .leading, actions: actions, shape: .rect(cornerRadius: 8)) { isExpanded in
        Image(systemName: "plus")
            .font(.title3.bold())
            .foregroundStyle(.white)
            .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black, in: .rect(cornerRadius: 8))
    }
    .padding()
}
```

https://github.com/user-attachments/assets/27aac4f9-f219-4732-bf0b-848ae4ebf562

**Trailing**:

```swift
ScrollView(.vertical) { ... }
.overlay(alignment: .bottomTrailing) {
    ExpandFloatButton(alignment: .trailing, actions: actions) { isExpanded in
        Image(systemName: "plus")
            .font(.title3.bold())
            .foregroundStyle(.white)
            .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black, in: .circle)
    }
    .padding()
}
```

https://github.com/user-attachments/assets/9e723ab3-eeed-4da1-8e2d-6b7f16bb483f

**Top**:

```swift
ScrollView(.vertical) { ... }
.overlay(alignment: .topTrailing) {
    ExpandFloatButton(alignment: .top, actions: actions) { isExpanded in
        Image(systemName: "plus")
            .font(.title3.bold())
            .foregroundStyle(.white)
            .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black, in: .circle)
    }
    .padding()
}
```

https://github.com/user-attachments/assets/5b53e2e9-5d0a-4f34-b79a-b2e8907dd335

**Bottom**:

```swift
ScrollView(.vertical) { ... }
.overlay(alignment: .bottomTrailing) {
    ExpandFloatButton(alignment: .bottom, actions: actions) { isExpanded in
        Image(systemName: "plus")
            .font(.title3.bold())
            .foregroundStyle(.white)
            .rotationEffect(.init(degrees: isExpanded ? 45 : 0))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black, in: .circle)
    }
    .padding()
}
```

https://github.com/user-attachments/assets/ddd4a195-e9a6-48e4-aebe-e4b2be86d593

The `ExpandFloatButton` efficiently enhances the user interface by integrating multiple action options into a single floating button. This design not only saves valuable screen space but also adds a sophisticated aesthetic element to the user interface. 

It is particularly beneficial in applications where quick access to multiple functions is necessary without cluttering the screen, offering an intuitive and streamlined user experience.

## HoldDownButton

A SwiftUI view that implements a hold-down button with progress feedback.

Parameters:
- `text`: The label displayed on the button.
- `paddingHorizontal`: Horizontal padding around the text.
- `paddingVertical`: Vertical padding around the text.
- `duration`: The time in seconds the button needs to be held to activate.
- `scale`: The scale effect applied to the button when pressed.
- `color`: The text color.
- `background`: The button's background color.
- `loadingTint`: The color of the progress indicator.
- `shape`: The shape of the button, defined using a generic `Shape`.
- `action`: The closure to execute when the hold duration is completed.

`HoldDownButton` allows users to interact with a button that requires being held down for a specific duration to activate. It visually indicates the progress of the hold duration using a loading bar and supports customizable text, colors, and shape.

Example:

```swift
VStack(spacing: 24) {
    HoldDownButton(text: "Hold Down Button", color: .white, background: .black, loadingTint: .yellow, clipShape: .capsule) {
        print("Finish")
    }
    
    HoldDownButton(text: "Hold Down Button", loadingTint: .white, clipShape: .rect(cornerRadius: 8)) {
        print("Finish")
    }
    
    HoldDownButton(text: "Hold Down Button") {
        print("Finish")
    }
    
    HoldDownButton(
        text: "Press and Hold",
        paddingHorizontal: 24,
        paddingVertical: 12,
        duration: 2,
        scale: 0.95,
        color: .white,
        background: .blue,
        loadingTint: .green.opacity(0.5),
        clipShape: RoundedRectangle(cornerRadius: 10),
        action: {
            print("Action triggered!")
        }
    )
}
```

https://github.com/user-attachments/assets/0270f8a3-5170-41bf-a04e-2e52170b78c7

This component is useful for actions that require confirmation or extended interaction, preventing accidental triggers.

## LoadingIndicator

## SimpleLoadingIndicator:

A simple, customizable loading indicator view. This view displays a circular loading indicator that rotates according to the specified loading speed. The appearance of the indicator, including its color, background color, line width, and speed, can be customized.

Parameters:
- `color`: The color of the loading indicator. Default is `.blue`.
- `backgroundColor`: The background color of the loading indicator. Default is `.gray`.
- `lineWidth`: The thickness of the loading indicator's line. Default is 5.
- `loadingSpeed`: The speed at which the loading indicator rotates. This uses the shared type [Speed](#speed). Default is `.medium`.

#### Speed

An enumeration representing the speed of an operation.

This enum provides both predefined and customizable time intervals to represent different speeds at which an operation can occur. Each case of the enum corresponds to a specific speed, with four predefined speeds and one customizable option, allowing for flexible loading behavior tailored to specific needs.

Cases:
- `flash`: A very fast operation speed, with a time interval of 0.1 second.
- `fast`: A fast operation speed, with a time interval of 1 second.
- `medium`: A medium operation speed, with a time interval of 2 seconds.
- `slow`: A slow operation speed, with a time interval of 3 seconds.
- `custom(TimeInterval)`: A customizable operation speed, where the time interval can be specified dynamically.

Example:

```swift
SimpleLoadingIndicator(color: .green, backgroundColor: .clear, lineWidth: 12, loadingSpeed: .custom(2))
    .frame(width: 200, height: 200)
```

https://github.com/user-attachments/assets/d3031c2d-6f4c-4f94-bfa7-ae2c3dd3e0ac

The loading indicator will rotate continuously to signify an ongoing loading process.

Visibility and Size:
- Frame Size: Adjust the indicator's frame size with `.frame(width:height:)` modifier to fit various UI spaces.
- Dynamic Visibility: Manage the visibility using `.opacity()` modifier or `if-else` conditions based on your application's state. This helps integrate the indicator seamlessly into your UI or hide it when not needed.

## FancyLoadingView

A SwiftUI view that displays a series of animated concentric circles, creating a dynamic loading indicator.

Parameters:
- `color`: The color of the circle strokes. The default is `.primary`.

Example:

```swift
FancyLoading()
```

https://github.com/user-attachments/assets/ceefa337-ac2d-4001-ae81-c5ee111a033c

Each circle in the animation is individually timed to create a smooth, rhythmic effect that visually indicates an ongoing process.

Visibility: 
- Manage the visibility using `.opacity()` modifier or `if-else` conditions based on your application's state. This helps integrate the indicator seamlessly into your UI or hide it when not needed.

## ShimmerView

A view displaying a shimmering loading placeholder.

This view simulates a 'shimmer' effect commonly used as a placeholder during content loading. It consists of multiple shimmering elements: a pair of small circular views at the top and bottom, and larger rectangular views in between, all showcasing the shimmer effect.

Example:

```swift
ShimmerView()
```

https://github.com/user-attachments/assets/8f921028-2d13-4ed6-9281-998a883fe53e

No additional configuration is needed. The shimmer effect starts automatically, simulating content loading in your UI.

Visibility: 
- Manage the visibility using `.opacity()` modifier or `if-else` conditions based on your application's state. This helps integrate the indicator seamlessly into your UI or hide it when not needed.

## ProgressView

## ProgressBar:

A rectangular progress bar view for SwiftUI.

Parameters:
- `progress`: A binding to a `CGFloat` that represents the current progress (from 0.0 to 1.0).
- `color`: The color of the bar's tint.
- `colors`: An array of `Color` to create a gradient for the progress bar (used when more than one color is desired).
- `backgroundColor`: The color of the bar's background.

You can use either a single color or a gradient of colors for the progress bar. The background of the bar can also be customized.

Example:

```swift
@State private var progress: CGFloat = 0.75

var body: some View {
    VStack(spacing: 30) {
        ProgressBar(progress: $progress, color: .green, backgroundColor: .clear)
            .frame(width: 300, height: 20)
        
        ProgressBar(progress: $progress, color: .orange, backgroundColor: .orange.opacity(0.2))
            .frame(width: 300, height: 20)
        
        ProgressBar(progress: $progress, colors: [.red, .blue])
            .frame(width: 300, height: 16)
        
        ProgressBar(progress: $progress, color: .blue)
            .frame(width: 300, height: 8)
        
        ProgressBar(progress: $progress, colors: [.indigo, .teal])
            .frame(width: 300, height: 8)
    }
}
```

<img src="https://github.com/user-attachments/assets/60cfef78-3aaa-4567-ae3e-b01a099d6aeb" width="220">

This view displays a rectangular progress indicator that fills up based on the current `progress`. The rectangle can be customized with different `colors` and a `backgroundColor`. If a gradient is desired, provide multiple colors.

Size:
- Frame Size: Adjust the view's frame size with `.frame(width:height:)` modifier to fit various UI spaces.

## RingProgress:

A circular progress bar view for SwiftUI.

Parameters:
- `progress`: A binding to a `CGFloat` that represents the current progress (from 0.0 to 1.0).
- `lineWidth`: The thickness of the progress bar's line.
- `startAngle`: The angle at which the progress starts, with `.zero` being the default.
- `color`: The color of the bar's tint.
- `colors`: An array of `Color` to create a gradient for the progress bar (used when more than one color is desired).
- `backgroundColor`: The color of the bar's background.

You can use either a single color or a gradient of colors for the progress bar.

Example:

```swift
@State private var progress: CGFloat = 0.75

var body: some View {
    VStack(spacing: 50) {
        HStack(spacing: 50) {
            RingProgress(progress: $progress, lineWidth: 16, startAngle: .degrees(90), color: .blue)
                .frame(width: 150, height: 150)
            
            RingProgress(progress: $progress, lineWidth: 12, startAngle: .degrees(90), color: .red)
                .frame(width: 80, height: 80)
        }
    
        HStack(spacing: 50) {
            RingProgress(progress: $progress, lineWidth: 16, startAngle: .degrees(90), colors: [.blue, .green])
                .frame(width: 150, height: 150)
            
            RingProgress(progress: $progress, lineWidth: 8, startAngle: .degrees(90), colors: [.red, .green])
                .frame(width: 50, height: 50)
        }
    }
}
```

<img src="https://github.com/user-attachments/assets/34af9314-f8e4-4695-ab76-a433d116b9f7" width="220">

This view displays a circular progress indicator that fills up based on the current `progress`. The progress circle can be customized with different `lineWidth`, `startAngle`, `colors`, and a `backgroundColor`.

Size:
- Frame Size: Adjust the view's frame size with `.frame(width:height:)` modifier to fit various UI spaces.

## ArcProgress:

A customizable circular progress bar for SwiftUI, unique for its adjustable trim and rotation.

Parameters:
- `progress`: A binding to a `CGFloat` that represents the current progress (from 0.0 to 1.0).
- `lineWidth`: The thickness of the progress bar's line.
- `color`: The color of the bar's tint.
- `colors`: An array of `Color` to create a gradient for the progress bar (used when more than one color is desired).
- `backgroundColor`: The color of the bar's background.

You can use either a single color or a gradient of colors for the progress bar.

Example:

```swift
@State private var progress: CGFloat = 0.75

var body: some View {
    VStack(spacing: 50) {
        HStack(spacing: 50) {
            ArcProgress(progress: $progress, lineWidth: 16, color: .red)
                .frame(width: 150, height: 150)
            
            
            ArcProgress(progress: $progress, lineWidth: 10, color: .pink)
                .frame(width: 50, height: 50)
        }
    
        HStack(spacing: 50) {
            ArcProgress(progress: $progress, lineWidth: 16, colors: [.orange, .yellow, .purple])
                .frame(width: 150, height: 150)
            
            ArcProgress(progress: $progress, lineWidth: 10, colors: [.yellow, .blue])
                .frame(width: 100, height: 100)
        }
    }
}
```

<img src="https://github.com/user-attachments/assets/aa098c14-1738-4c18-b706-50d8754b920c" width="220">

This view displays a circular progress indicator that fills up based on the current `progress`, but unlike traditional full-circle progress bars, this one fills up to 75% of the circle. The progress circle can be customized with different `lineWidth`, `colors`, and a `backgroundColor`.

The progress bar uniquely fills up to 75% of the circle and starts at a 135-degree angle.

Size:
- Frame Size: Adjust the view's frame size with `.frame(width:height:)` modifier to fit various UI spaces.

## QRScanner

A robust QR code scanner view for SwiftUI, providing interactive scanning capabilities.

`QRScannerView` integrates camera functionality to scan QR codes and handle the results dynamically through a completion handler. It supports customization of scanning animation and error handling.

Parameters:
- `isScanning`: A binding to control the scanning process.
- `showScanningAnimation`: A Boolean value that determines whether to show a scanning animation.
- `showErrorAlert`: A Boolean value that determines whether to show an alert on scanning errors.
- `completion`: A closure executed with the scanning result, returning a `String` on success or an `Error` on failure.

```swift
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
```

https://github.com/user-attachments/assets/5d320f81-59a1-4581-99dd-b3efb1566532

This component is designed to provide a seamless integration of QR scanning functionality within your SwiftUI applications, enhancing user interaction and data capture capabilities.

## SegmentControl

A customizable segment control view in SwiftUI.

`SegmentControl` provides a customizable segmented control interface, allowing for the selection among multiple options. It features customizable active/inactive tint colors, an adjustable height, and a dynamic or static indicator for the active tab. Additionally, it offers a configuration for the indicator's appearance and position based on the selected segment.

Parameters:
- `tabs`: An array of `Item`, representing each segment option. Required to conform to `Hashable`.
- `activeTab`: A binding to the currently active segment.
- `height`: The height of the segment control.
- `activeTint`: Color for the active segment.
- `inActiveTint`: Color for inactive segments.
- `indicatorConfiguration`: Configuration for the segment indicator, including color and corner radius.
- `displayItem`: A closure that provides a view for displaying each segment option.

Example:

```swift
enum SegmentedTab: String, CaseIterable {
   case home = "Home"
   case favorite = "Love"
   case profile = "Profile"

   var imageName: String {
       switch self {
       case .home:
           return "house.fill"
      case .favorite:
           return "heart.fill"
       case .profile:
           return "person.crop.circle"
       }
   }
}

@State private var activeTab: SegmentedTab = .home
@State private var activeTab2: SegmentedTab = .home
@State private var activeTab3: SegmentedTab = .home

var body: some View {
    VStack(spacing: 25) {
        SegmentControl(tabs: SegmentedTab.allCases, activeTab: $activeTab, height: 40, activeTint: .primary, inActiveTint: .gray.opacity(0.5), indicatorConfiguration: .init(tint: .blue, cornerRadius: 0, style: .bottom)) { item in
            HStack {
                Image(systemName: item.imageName)
                Text(item.rawValue)
            }
            .font(.title3)
        }
        
        SegmentControl(tabs: SegmentedTab.allCases, activeTab: $activeTab2, height: 40, activeTint: .primary, inActiveTint: .gray.opacity(0.5), indicatorConfiguration: .init(tint: .orange, cornerRadius: 4, style: .background)) { item in
            HStack {
                Image(systemName: item.imageName)
                
                Text(item.rawValue)
            }
            .font(.title3)
        }
        
        SegmentControl(tabs: SegmentedTab.allCases, activeTab: $activeTab3, height: 40, activeTint: .primary, inActiveTint: .gray.opacity(0.5), indicatorConfiguration: .init(tint: .yellow, cornerRadius: 20, style: .background)) { item in
            HStack {
                Image(systemName: item.imageName)
                
                Text(item.rawValue)
            }
            .font(.title3)
        }
    }
    .padding()
}
```

https://github.com/user-attachments/assets/6ac4766d-f27f-4885-9b95-927cf67d30cf

This example demonstrates a `SegmentControl` with custom tab items, including icons and text, showcasing how to integrate it into a SwiftUI view.

## Slider

## RangeSlider:

A customizable range slider view in SwiftUI.

Allows users to select a closed range of values using two draggable thumbs. This component is highly customizable with options for defining the range limits, thumb spacing, and appearance.

Parameters:
- `selection`: A binding to the selected range of values.
- `range`: The total range from which values can be selected.
- `minimumDistance`: The minimum allowable distance between the two thumbs.
- `lineWidth`: The thickness of the slider's active range.
- `tint`: The color of the slider's active range and thumbs.
- `backgroundColor`: The color of the slider's track.
- `controlConfig`: [ControlConfig](#rangesliderconfiguration) is the configuration for the control's appearance including thumb tint, width, and shadow of `RangeSlider`.

#### RangeSliderConfiguration:

`ControlConfig` provides customizable settings for UI controls of `RangeSlider`.

Parameters:
- `tint`: The color used for the control. Defaults to `.white`.
- `width`: The width of the control in points. This could affect the size of the control or its border depending on how it's used.
- `enableShadow`: Determines whether a shadow is applied to the control. Defaults to `true`.

This structure configures the appearance and behavior of the slider controls in `RangeSlider`, including the color, width, and shadow of the slider handles.

Example:

```swift
@State private var selection: ClosedRange<CGFloat> = 60...90
@State private var selection2: ClosedRange<CGFloat> = 10...50

var body: some View {
    VStack(spacing: 50) {
        RangeSlider(
            selection: $selection,
            range: 10...100,
            minimumDistance: 10,
            lineWidth: 15,
            tint: .red,
            controlConfig: .init(width: 20, enableShadow: true)
        )
        .frame(height: 100)
        
        Text("\(Int(selection.lowerBound)):\(Int(selection.upperBound))")
            .font(.largeTitle.bold())
            .padding(.top, 10)
        
        RangeSlider(
            selection: $selection2,
            range: 0...100,
            minimumDistance: 1,
            lineWidth: 8,
            tint: .green,
            controlConfig: .init(width: 12, enableShadow: true)
        )
        .frame(height: 100)
        
        Text("\(Int(selection2.lowerBound)):\(Int(selection2.upperBound))")
            .font(.largeTitle.bold())
            .padding(.top, 10)
    }
}
```

https://github.com/user-attachments/assets/1da84ea4-53cc-4565-a63e-8fb03e7b1836

This setup demonstrates configuring a `RangeSlider`, displaying the selected value range with customized control appearance.

## RingSlider:

A customizable ring-shaped slider view for selecting angular ranges.

`RingSlider` provides a visual and interactive way to select a range of angles using draggable handles that can be customized with images or styled directly via a `ControlConfig`. The appearance of the slider, including line width, colors, and handle customization, is adjustable.

Parameters:
- `startAngle`: The starting angle of the slider, modifiable via a binding.
- `toAngle`: The ending angle of the slider, modifiable via a binding.
- `lineWidth`: The thickness of the ring's line.
- `tint`: The primary color of the slider's line and handle if not using images.
- `backgroundColor`: The color behind the slider's line for contrast.
- `controlConfig`: [ControlConfig](#ringsliderconfiguration) is the configuration for the slider's handles, including color, width, images, and shadow of `RingSlider`.

#### RingSliderConfiguration:

`ControlConfig` provides customizable settings for UI controls of `RingSlider`.

Parameters:
- `tint`: The color used for the slider control's tint, defaulting to `.white`.
- `width`: The thickness or size of the slider handles in points.
- `startSliderImage`: An optional image for the slider's starting handle.
- `endSliderImage`: An optional image for the slider's ending handle.
- `enableShadow`: A Boolean value that determines whether a shadow is applied to the slider handles, defaulting to `true`.

This structure configures the appearance and behavior of the slider controls in `RingSlider`, including optional images for slider handles and shadow effects.

Example:

```swift
@State var startAngle: Angle = .degrees(50)
@State var endAngle: Angle = .degrees(90)

var body: some View {
    VStack(spacing: 50) {
        RingSlider(
            startAngle: $startAngle,
            toAngle: $endAngle,
            lineWidth: 40,
            tint: .purple,
            controlConfig: .init(width: 40, startSliderImage: Image(systemName: "moon.fill"),
                                 endSliderImage: Image(systemName: "alarm"))
        )
        .frame(width: 300, height: 300)
        
        Text("Start Angle: \(Int(startAngle.degrees)) - End Angle: \(Int(endAngle.degrees))")
    }
}
```

https://github.com/user-attachments/assets/e87cc06d-2877-4b49-88e8-b45165117e48

This configuration leverages the `ControlConfig` to apply custom images for the handles and additional styling options, enhancing the user interaction experience.

## Text

## CircularText:

A SwiftUI view that arranges text in a circular path with enhanced customization.

`CircularText` displays text along a specified radius, offering settings for alignment, character spacing, and style reversal. It utilizes a generic view modifier to apply custom styling to each character, making it versatile for various design needs.

Parameters:
- `text`: The string of text to be displayed circularly.
- `radius`: The radius of the circle along which the text is arranged.
- `spacing`: The spacing between characters, defaulting to 4.
- `alignment`: The position of the text relative to the circle's radius (`inside`, `center`, `outside`).
- `reverseStyle`: If `true`, reverses the direction and orientation of the text.
- `textModifier`: A closure that allows for custom styling of the text, applied per character.

Example:

```swift
VStack(spacing: 40) {
    ZStack {
        Circle()
            .fill(.gray.opacity(0.3))
        
        CircularText(text: "#OPENTOWORK", radius: 150, spacing: 8, alignment: .outside, reverseStyle: false)
            .font(.largeTitle.bold())
            .lineSpacing(5)
    }
    .frame(width: 300, height: 300)
    
    ZStack {
        Circle()
            .fill(.gray.opacity(0.3))
        
        CircularText(text: "#OPENTOWORK", radius: 150, spacing: 8, alignment: .inside, reverseStyle: true, textModifier: { text in
            text.font(.largeTitle.bold())
                .lineSpacing(5)
        })
        .rotationEffect(.degrees(-140))
    }
    .frame(width: 300, height: 300)
}
```

<img src="https://github.com/user-attachments/assets/556ebe60-acb5-440a-a69a-7d6b5ebe987e" width="220">

This view is perfect for creating visually compelling text effects such as circular labels or decorative text in a SwiftUI application.

## HackerText:

Provides an animated text effect that mimics hacking by changing characters randomly before revealing the final text.

Parameters:
- `text`: The final text to display after animation.
- `trigger`: A Boolean that starts the animation when toggled.
- `transition`:  The style of animation — either `hyper` for all hacker style or `numeric` for wheeling style only.
- `duration`: Total animation duration.
- `speed`: Time interval for character changes. This uses the shared type [Speed](#speed).

Example:

```swift
@State private var trigger: Bool = false
@State private var text = "Common SwiftUI"

var body: some View {
    VStack(alignment: .leading, spacing: 30) {
        HackerText(
            text: text,
            trigger: trigger,
            transition: .hyper,
            speed: .custom(0.06)
        )
        .font(.largeTitle.bold())
        .lineLimit(2)
        
        HackerText(
            text: text,
            trigger: trigger,
            transition: .numeric,
            speed: .custom(0.06)
        )
        .font(.largeTitle.bold())
        .lineLimit(2)
        
        Button(action: {
            if text == "Common SwiftUI" {
                text = "Made with SwiftUI\nBy James Thang"
            } else {
                text = "Common SwiftUI"
            }
            trigger.toggle()
        }, label: {
            Text("Trigger")
                .fontWeight(.semibold)
            
        })
        .buttonStyle(.borderedProminent)
        .frame(maxWidth: .infinity)
    }
    .padding(15)
    .frame(maxWidth: .infinity, alignment: .leading)
}
```

https://github.com/user-attachments/assets/5c0f3ebb-e8e5-41f4-8a30-20ad7bceab9c

This view is particularly effective for creating engaging and eye-catching textual displays in apps that require a dramatic presentation.

## TypeWriterText:

A SwiftUI view that simulates a typewriter effect for displaying text.

This view gradually displays characters of a string, mimicking the typing effect seen in a typewriter. Customization options include font, weight, color, alignment, and the speed of typing. The speed of typing can be one of the predefined speeds or a custom duration specified in seconds.

Parameters:
- `text`: The text to display using the typewriter effect.
- `font`: The font style of the text. Default is `.caption`.
- `fontWeight`: The weight of the font. Default is `.medium`.
- `color`: The color of the text. Default is `.primary`.
- `alignment`: The alignment of the text within its container. Default is `.center`.
- `speed`: The speed at which characters are displayed. This uses the shared type [Speed](#speed). Default is `.flash`.

Example:

```swift
VStack(spacing: 16){
    TypeWriterText(text: "James Thang", font: .title, fontWeight: .regular)

    TypeWriterText(text: "iOS Developer | Author | Builder | Writer | Dreamer", font: .title2)

    TypeWriterText(text: "My journey through the tech world is a testament to the idea that anyone can follow their passion and acquire new skills. While my educational background lies in Finance and Economics, I felt a compelling drive to explore the dynamic realm of Apps development. The potentials of it that anyone in this modern world now have a smartphone with them and spend most of their daily time on it. With dedication and self-education, I transitioned into a seasoned iOS developer and then a professional one, accumulating over 3 years of valuable industry experience.", speed: .flash)
}
```

https://github.com/user-attachments/assets/824d41a8-1e3d-4c07-9607-c669073a7ab1

This view is ideal for scenarios where text needs to be presented in a dramatic, engaging manner.

## TextField

## LimitedTextField:

A SwiftUI view that provides a text field with a character limit and visual feedback on input progress.

`LimitedTextField` offers a customizable text input field that restricts the number of characters based on a specified limit. It features visual indicators such as a progress ring or text counter and can be styled with custom colors and borders.

Parameters:
- `config`: [Config](#limitedtextfieldconfiguration) is the configuration settings including character limit, tint, resizing behavior, and typing overflow control. Details below.
- `hint`: Placeholder text displayed when the text field is empty.
- `value`: A binding to the text inputted by the user.

#### LimitedTextFieldConfiguration:

Manages the main settings for the text field.

Parameters:
- `limit`: The maximum number of characters.
- `tint`: The color of the text and progress indicators.
- `autoResizes`: Whether the text field should automatically resize to fit content.
- `allowExcessTyping`: Allows input beyond the limit without saving excess characters.
- `progressConfig`: [ProgressConfig](#progressconfig) is settings for the progress indicators.
- `borderConfig`: [BorderConfig](#borderconfig) is the styling options for the border.

#### ProgressConfig: 

Configures visual feedback on typing progress.

Parameters:
- `showsRing`: Displays a circular progress ring.
- `showsText`: Shows current and maximum character counts.
- `alignment`: Aligns the progress text indicator.

#### BorderConfig: 

Customizes the border appearance.

Parameters:
- `show`: Enables or disables the border.
- `radius`: Sets the border radius.
- `width`: Defines the border thickness.

Example:

```swift
@State private var text: String = ""

var body: some View {
    LimitedTextField(
        config: .init(
            limit: 40,
            tint: .secondary,
            autoResizes: true,
            allowExcessTyping: false
        ),
        hint: "Type here",
        value: $text
    )
    .frame(height: 150)
}
```

https://github.com/user-attachments/assets/aa287e0d-11e1-4af8-bb47-ffd2e6ed3bc6

This component is ideal for forms, comments, or any user input that requires length constraints.

## ValidationTextField:

A SwiftUI view that provides a text field with extensive validation capabilities, including secure text entry.

`ValidationTextField` allows visual feedback and validation for user inputs, suitable for both standard and secure text fields. It supports environmental properties to customize behavior and appearance based on validation results.

Parameters:
- `title`: The label text for the text field.
- `text`: A binding to the user input text.
- `isValidBinding`: A binding reflecting the current validation state.
- `isSecured`: Indicates if the text field should obscure text input.
- `config`: Configuration for visual properties like border and validation message styles.

Modifiers:
- `clearButtonHidden`: Controls visibility of the clear button.
- `secureButtonHidden`: Controls visibility of the secure text toggle button.
- `isMandatory`: Marks the field as required and provides a custom message if validation fails.
- `onValidate`: Adds custom validation logic for the text field.
- `onFormValidate`: Handles form-level validation by providing an array of validation results.

Example 1:

```swift
enum FocusableField {
    case firstName, lastName, address, password
}

@State private var firstName = ""
@State private var lastName = ""
@FocusState private var focus: FocusableField?
@State private var isFormFirstNameValid = false
@State private var isFormLastNameValid = false

var body: some View {
    VStack(spacing: 15) {
        ValidationTextField(title: "First Name", text: $firstName, isValid: $isFormFirstNameValid)
            .autocorrectionDisabled()
            .focused($focus, equals: .firstName)
            .isMandatory(true)
        
        
        ValidationTextField(title: "Last Name", text: $lastName, isValid: $isFormLastNameValid)
            .focused($focus, equals: .lastName)
            .isMandatory(true)
    
        Spacer()
        Button("Submit") {
            // Handle submit logic
        }
        .buttonStyle(.borderedProminent)
        .disabled(!(isFormFirstNameValid && isFormLastNameValid))
    }
}
```

https://github.com/user-attachments/assets/094f4f2b-79c6-4c5d-bae8-a55e2a8644b3

Example 2:

```swift
@State private var address = ""

var body: some View {
    ValidationTextField(title: "Address", text: $address)
        .clearButtonHidden(false)
        .autocorrectionDisabled()
        .padding()
}
```

https://github.com/user-attachments/assets/ff78da93-0d69-4908-bc7a-7afebf1b5517

Example 3:

```swift
enum FocusableField {
    case firstName, lastName, address, password
}


enum TextFieldError: LocalizedError {
    case weakPassword
    var errorDescription: String? {
        switch self {
        case .weakPassword:
            return "Password has to be at least 6 characters"
        }
    }
}

@State private var password = ""
@FocusState private var focus: FocusableField?
@State private var isPasswordValid = false

var body: some View {
    VStack(spacing: 15) {
        ValidationTextField(title: "Password", text: $password, isValid: $isPasswordValid, isSecured: true)
            .focused($focus, equals: .password)
            .isMandatory(true)
            .onValidate { value in
                value.count >= 6 ? .success("Good Password") : .failure(TextFieldError.weakPassword)
            }
            .secureTextButtonHidden(false)
            .autocorrectionDisabled()
        
        
        Spacer()
        Button("Submit") {
            // Handle submit logic
        }
        .disabled(!isPasswordValid)
    }
}
```

https://github.com/user-attachments/assets/5665eb71-4dae-40cb-b80a-131e0c24ce85

Example 4:

```swift
enum FocusableField {
    case firstName, lastName, address, password
}

@State private var password = ""
@FocusState private var focus: FocusableField?
@State private var isPasswordValid = false

var body: some View {
    VStack(spacing: 15) {
        ValidationTextField(title: "Strong Password", text: $password, isValid: $isPasswordValid, isSecured: true)
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
        
        
        Spacer()
        Button("Submit") {
            // Handle submit logic
        }
        .buttonStyle(.borderedProminent)
        .disabled(!isPasswordValid)
    }
}
```

https://github.com/user-attachments/assets/2186ed83-f8c6-490c-80fb-fb15ad682b69

Now using this powerful component to make a Sign Up Screen:

```swift
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
}
```

https://github.com/user-attachments/assets/f859f4cf-6f87-4dfb-8d80-73446d926f79

This example effectively demonstrates how to configure and use `ValidationTextField` for a form handling multiple fields, ensuring that all entries meet specified validation criteria before enabling form submission.

## Toast

`Toast` provides functionality to present and remove toast messages.

Access the shared singleton instance with `Toast.shared`. It uses an observable object pattern to update UI components when toasts are added or removed.

Use this function `present` to display a toast message with customizable options.

```swift
public func present(title: String, symbol: String?, tint: Color = .primary, isUserInteractionEnabled: Bool = false, timing: Speed = .medium)
```

Parameters:
- `title`: The text to display in the toast.
- `symbol`: An optional symbol to display alongside the text. Defaults to nil.
- `tint`: The color of the text and symbol. Defaults to `.primary`.
- `isUserInteractionEnabled`: A Boolean value that determines whether the toast allows user interaction. Defaults to false.
- `timing`: The duration for which the toast should remain on screen. This uses the shared type [Speed](#speed). Defaults to `.medium`.

The first required step is to wrapped your Application inside [RootView](#rootview):

```swift
@main
struct TestCommonUIApp: App {
    var body: some Scene {
        WindowGroup {
            RootView {
                ContentView()
            }
        }
    }
}
```

Now for every scene, use the `present` method from the singleton `Toast.shared` to present your toast message:

```swift
VStack(spacing: 25) {
    Button("Toast 1") {
        Toast.shared.present(
            title: "Hello World",
            symbol: "hand.wave",
            tint: .blue,
            isUserInteractionEnabled: true,
            timing: .slow
        )
    }
    
    Button("Toast 2") {
        Toast.shared.present(
            title: "I am James Thang",
            symbol: "book.fill",
            tint: .black,
            isUserInteractionEnabled: true,
            timing: .slow
        )
    }
    
    Button("Toast 3") {
        Toast.shared.present(
            title: "This is CommonSwiftUI",
            symbol: "lightbulb.circle.fill",
            tint: .purple,
            isUserInteractionEnabled: true,
            timing: .slow
        )
    }
}
```

https://github.com/user-attachments/assets/08d17817-882b-4be3-8157-246a214df992

All of the toast messages will be at the top level of your application.

The `Toast` component provides a streamlined and non-intrusive way to display brief notifications or messages within an application's interface. 

## ViewModifier

## ViewDidLoad

## VersionCondition

## Author
James Thang, find me on [LinkedIn](https://www.linkedin.com/in/jamesthang/)
