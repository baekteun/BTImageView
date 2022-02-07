# BTImageView


<!--[![CI Status](https://img.shields.io/travis/baekteun/BTImageView.svg?style=flat)](https://travis-ci.org/baekteun/BTImageView)-->
[![Version](https://img.shields.io/cocoapods/v/BTImageView.svg?style=flat)](https://cocoapods.org/pods/BTImageView)
[![License](https://img.shields.io/cocoapods/l/BTImageView.svg?style=flat)](https://cocoapods.org/pods/BTImageView)
[![Platform](https://img.shields.io/cocoapods/p/BTImageView.svg?style=flat)](https://cocoapods.org/pods/BTImageView)


## Requirements

- iOS 9.0 or higher
- Swift 5.0 

## Usage
### import
```swift
import BTImageView
```

### Use
#### Storyboard
Add a custom view to the storyboard and set its class to "BTImageView".

#### Programmatically
Initialize `BTImageView` programmatically
```swift
let imageView = BTImageView()
view.addSubView(imageView)
```

## BTImageView
### Properties
```swift
var imageViews: [UIImaeView] // All UIImageViews in BTImageView. (Default: [])

var images: [UIImage] // All UIImages in BTImageView. (Default: [])

var aligns: [Int] // Item align in BTImageView. (Default: [1])

var axis: NSLayoutConstraint.Axis // ImageViews's direction where its pile up (Default: .horizontal)

var spacing: CGFloat // The spacing of the imageViews. (Default: 5)
```

### Methods
```swift
func addImage(image: UIImage)
```
Add a image with UIImage into the BTImageView

```swift
func addImage(url: String)
```
Add a image with URLstring into the BTImageView

```swift
func setImages(images: [UIImage])
```
Set images with UIImages of the BTImageView

```swift
func setImages(urls: [String])
```
Set images with URLstrings of the BTImageView

```swift
func removeFirstImage()
func removeLastImage()
func removeImage(at index: Int)
func removeAllImage()
```
Remove image from the BTImageViewg

## Installation
### Swift Package Manager
BTImageView is available througb [SPM](https://github.com/apple/swift-package-manager). To install it, simply add the following line to your Package.swift:
```swift
// Package.swift

dependencies: [
    .package(url: "https://github.com/baekteun/BTImageView", from: "1.0.8")
]
```

### Cocoapods
BTImageView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
# Podfile

pod 'BTImageView'
```

## Author

baekteun, baegteun@gmail.com

## License

BTImageView is available under the MIT license. See the LICENSE file for more info.
