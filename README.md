# CommonSwiftUI

![iOS 15.0+](https://img.shields.io/badge/iOS-15.0%2B-blue.svg)
[![Pod Version](http://img.shields.io/cocoapods/v/SDWebImage.svg?style=flat)](https://cocoapods.org/pods/Tutorials)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://mit-license.org)

## Table of Contents
1. [Overview](#overview)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Features](#features)
5. [Usage](#usage)
6. [Author](#author)

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

## Features

1. [Alert](#alert)
2. [Button](#button)
3. [Dropdown](#dropdown)
4. [LoadingIndicator](#loadingindicator)
5. [ProgressView](#progressview)
6. [QRScanner](#qrscanner)
7. [SegmentControl](#segmentcontrol)
8. [Slider](#slider)
9. [Text](#text)
10. [TextField](#textfield)
11. [Toast](#toast)
12. [ViewModifier](#viewmodifier)

## Importing the Library

To use any of the components provided by `CommonSwiftUI`, such as `RangeSlider` or `QRScannerView`, you need to import the library at the beginning of your SwiftUI view file. This ensures that all the features and components from the library are accessible in that file. Simply add the following line at the top of your `.swift` file where you plan to use these components:

```swift
import CommonSwiftUI
```

## Usage

## Alert

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

## Button

### 2.1 CapsuleButtonStyle:

A `ButtonStyle` for SwiftUI that applies a Capsule Shape with customizable color styles.

```swift
let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)

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
```

This style gives buttons a modern, rounded look suitable for various UI contexts.

<img src="https://github.com/user-attachments/assets/89fcae09-da1b-4470-96b1-b01bd75a692f" width="220">

Parameters:
- `textColor`: The color or style applied to the text inside the button. Defaults to `.white`.
- `backgroundColor`: The background color or style of the button, conforming to `ShapeStyle`. Defaults to `.blue`.
- `verticalPadding`: The vertical padding inside the button. Defaults to `10`.
- `horizontalPadding`: The horizontal padding inside the button. Defaults to `20`.

### 2.2 ShapeButtonStyle:

A `ButtonStyle` for SwiftUI that allows customization of the button's shape and color.

```swift
let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)

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
```

This style modifies the appearance of buttons to fit within a specified shape, with customizable foreground, background colors and padding. It is highly flexible, accommodating various shapes and color styles.

<img src="https://github.com/user-attachments/assets/bd90bcd0-3510-4796-903e-4f78ac4b12c3" width="220">

Parameters:
- `textColor`: The color or style applied to the text inside the button. Default is `.primary`.
- `backgroundColor`: The background color or style of the button, conforming to `ShapeStyle`. Default is `.secondary`.
- `shape`: The custom shape for the button, conforming to `Shape`. The default shape is `Capsule()`.
- `verticalPadding`: The vertical padding inside the button. Defaults to `10`.
- `horizontalPadding`: The horizontal padding inside the button. Defaults to `20`.

### 2.3 GrowingButtonStyle:

A `ButtonStyle` for SwiftUI that scales the button on press, with customizable shape and color styles.

```swift
let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)

VStack(spacing: 25) {
    Button("Growing 1") { }
        .buttonStyle(GrowingButtonStyle())
    
    Button("Growing 2") { }
        .buttonStyle(GrowingButtonStyle(textColor: .primary, backgroundColor: .green, shape: .rect(cornerRadius: 4)))
    
    Button("Growing 3") { }
        .buttonStyle(GrowingButtonStyle(textColor: .primary, backgroundColor: gradient, shape: .rect(cornerRadius: 4)))
}
```

This button style provides an interactive feedback effect by increasing the button's scale when pressed. It allows for customization of the button's foreground and background colors, shape, and padding.

https://github.com/user-attachments/assets/9520da94-8b87-4a84-83e9-da7b79dbaeab

Parameters:
- `textColor`: The color or style for the text inside the button, defaulting to `.white`.
- `backgroundColor`: The background color or style of the button, conforming to `ShapeStyle`, with a default of `.blue`.
- `shape`: The custom shape for the button, conforming to `Shape`. The default shape is `Capsule()`.
- `verticalPadding`: The vertical padding inside the button. Defaults to `10`.
- `horizontalPadding`: The horizontal padding inside the button. Defaults to `20`.

### 2.4 LoadingButtonStyle:

A `ButtonStyle` for SwiftUI that provides a customizable button with a loading indicator.

```swift
@State private var isLoading: Bool = false

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
```

This button style offers interactive feedback by displaying a `ProgressView` when in a loading state. It allows for extensive customization of the button's appearance, including text color, background color, shape, padding, and the position of the loading indicator. When loading, the button can optionally gray out the background and disable user interactions.

https://github.com/user-attachments/assets/b6fa0b46-53dc-4f81-bc84-fd467c74e407

Parameters:
- `isLoading`: A binding to a boolean indicating whether the button is in a loading state.
- `loadingState`: An enum that determines the button's behavior when loading. Defaults to `.center`.
- `textColor`: The color or style for the text inside the button, defaulting to `.white`.
- `backgroundColor`: The background color or style of the button, conforming to `ShapeStyle`, with a default of `.blue`.
- `disabledLoadingColor`: The background color or style of the button when it is loading, conforming to `ShapeStyle`, with a default of `.gray`.
- `shape`: The custom shape for the button, conforming to `Shape`. The default shape is `Capsule()`.
- `verticalPadding`: The vertical padding inside the button. Defaults to `10`.
- `horizontalPadding`: The horizontal padding inside the button. Defaults to `20`.

## Dropdown

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

## LoadingIndicator

### 5.1. Simple Loading Indicator:

A simple, customizable loading indicator view. This view displays a circular loading indicator that rotates according to the specified loading speed. The appearance of the indicator, including its color, background color, line width, and speed, can be customized.

```swift
SimpleLoadingIndicator(color: .green, backgroundColor: .clear, lineWidth: 12, loadingSpeed: .custom(2))
    .frame(width: 200, height: 200)
```

The loading indicator will rotate continuously to signify an ongoing loading process.

https://github.com/user-attachments/assets/d3031c2d-6f4c-4f94-bfa7-ae2c3dd3e0ac

Parameters:
- `color`: The color of the loading indicator. Default is `.blue`.
- `backgroundColor`: The background color of the loading indicator. Default is `.gray`.
- `lineWidth`: The thickness of the loading indicator's line. Default is 5.
- `loadingSpeed`: The speed at which the loading indicator rotates. Default is `.medium`.

Visibility and Size:
- Frame Size: Adjust the indicator's frame size with `.frame(width:height:)` modifier to fit various UI spaces.
- Dynamic Visibility: Manage the visibility using `.opacity()` modifier or `if-else` conditions based on your application's state. This helps integrate the indicator seamlessly into your UI or hide it when not needed.

### 5.2. Fancy Loading View

A SwiftUI view that displays a series of animated concentric circles, creating a dynamic loading indicator.

```swift
FancyLoading()
```

Each circle in the animation is individually timed to create a smooth, rhythmic effect that visually indicates an ongoing process.

https://github.com/user-attachments/assets/ceefa337-ac2d-4001-ae81-c5ee111a033c

Parameters:
- `color`: The color of the circle strokes. The default is `.primary`.

Visibility: 
- Manage the visibility using `.opacity()` modifier or `if-else` conditions based on your application's state. This helps integrate the indicator seamlessly into your UI or hide it when not needed.

## ProgressView

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

## QRScanner

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

## SegmentControl

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

## Slider

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

## Text

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

## TextField

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

## Toast

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

## ViewModifier

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

## Author
James Thang, find me on [LinkedIn](https://www.linkedin.com/in/jamesthang/)
