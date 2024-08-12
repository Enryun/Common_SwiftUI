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
3. [ButtonStyle](#buttonstyle)
4. [Dropdown](#dropdown)
5. [LoadingIndicator](#loadingIndicator)
6. [ProgressView](#progressview)
7. [QRScanner](#qrscanner)
8. [SegmentControl](#segmentcontrol)
9. [Slider](#slider)
10. [Text](#text)
11. [TextField](#textfield)
12. [Toast](#toast)
13. [ViewModifier](#viewmodifier)

## Importing the Library

To use any of the components provided by `CommonSwiftUI`, such as `RangeSlider` or `QRScannerView`, you need to import the library at the beginning of your SwiftUI view file. This ensures that all the features and components from the library are accessible in that file. Simply add the following line at the top of your `.swift` file where you plan to use these components:

```swift
import CommonSwiftUI
```

## Usage

### Alert

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

### Button

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

#### ROTATING BUTTON

### Dropdown

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

### LoadingIndicator

#### 5.1. SimpleLoadingIndicator:

A simple, customizable loading indicator view. This view displays a circular loading indicator that rotates according to the specified loading speed. The appearance of the indicator, including its color, background color, line width, and speed, can be customized.

```swift
let configuration = TutorialConfiguration(
            title: .init(font: .systemFont(ofSize: 24, weight: .semibold), textColor: .label),
            description: .init(font: .systemFont(ofSize: 16, weight: .regular), textColor: .label),
            backgroundColor: BackgroundColor(ligtModeColor: .init(color: .systemYellow, opacity: 0.7), darkModeColor: .init(color: .systemGreen, opacity: 0.3)),
            sound: .tap,
            alignment: .bottom
        )
```

The loading indicator will rotate continuously to signify an ongoing loading process.

Parameters:
- `color`: The color of the loading indicator. Default is `.blue`.
- `backgroundColor`: The background color of the loading indicator. Default is `.gray`.
- `lineWidth`: The thickness of the loading indicator's line. Default is 5.
- `loadingSpeed`: The speed at which the loading indicator rotates. Default is `.medium`.

### ProgressView

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

### QRScanner

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

### SegmentControl

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

### Slider

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

### Text

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

### TextField

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

### Toast

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

### ViewModifier

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras imperdiet velit dolor, sed porta est ullamcorper in. Nulla at condimentum dolor. Etiam mattis nibh nec sollicitudin facilisis. Nam pretium justo neque, ut tempus arcu tristique ut. Mauris in tortor volutpat, euismod orci id, iaculis quam. Sed vel lacus ex. Integer nibh ex, interdum eu velit vel, fringilla placerat quam. Duis viverra porta nibh, in condimentum purus. Ut in dolor suscipit, maximus purus a, mattis elit. Suspendisse hendrerit feugiat velit a ultricies. Aenean fringilla aliquam odio, non pellentesque odio eleifend in. Suspendisse potenti.

Integer facilisis id nulla ac pretium. Nam consequat neque non elit posuere, lobortis laoreet nunc tempor. Duis at consectetur enim, nec ultrices velit. Suspendisse ac risus enim. Nullam feugiat nisi nulla, a vulputate augue mattis ac. Nunc molestie ligula dui, vitae faucibus nibh iaculis at. Etiam blandit nulla sit amet vestibulum dapibus. Ut feugiat tristique leo a luctus. Sed pharetra est vitae magna suscipit, eu interdum metus elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum faucibus arcu. Quisque feugiat et sapien eget lobortis. Maecenas egestas enim lacinia gravida suscipit. Mauris nunc sem, dictum vel diam ut, rhoncus feugiat magna.

## Author
James Thang, find me on [LinkedIn](https://www.linkedin.com/in/jamesthang/)
