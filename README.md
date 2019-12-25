Rippleable: Ripple-Effecting Button in Swift

Inspired by material ios design

Exmaple

```swift
/// outLined-styled button
let outLinedButton: RippleableButton = {
  let button = RippleableButton(type: .outlined)
  button.layer.cornerRadius = 5
  button.setTitle("Hello World!", for: .normal)
  button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
  button.primaryColor = .blue
  return button
}()

/// cointained-styled button
let containedButton: RippleableButton = {
  let button = RippleableButton(type: .contained)
  button.layer.cornerRadius = 5
  button.setTitle("Hello World!", for: .normal)
  button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
  button.primaryColor = .blue
  return button
}()

/// text-styled button
let textButton: RippleableButton = {
  let button = RippleableButton(type: .text)
  button.layer.cornerRadius = 5
  button.setTitle("Hello World!", for: .normal)
  button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
  button.primaryColor = .blue
  return button
}()
```
## Requirements

Rippleable is written in Xcode 11, Swift 5.0, iOS 10.0 Required.

## Installation

Rippleable is available through Cocoapods.

```ruby
pod "Rippleable"
````
## Contribution

Pull Requests are welcomed.

## Author

sesang06, sesang06@naver.com

## License

Rippleable is available under the MIT license.
