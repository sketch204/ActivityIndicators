<H1 align="center">ActivityIndicators</H1>

<p align="center">Use this small library to add a simple activity indicator to your <code>SwiftUI</code> apps!</p>
<p align="center">
    <img src="https://github.com/sketch204/ActivityIndicators/blob/master/demo.gif"/>
</p>

### Installation

The preferred way of installing this library is through the Swift Package Manager.

1. In Xcode, open your project and navigate to File → Swift Packages → Add Package Dependency...
2. Paste the repository URL (https://github.com/sketch204/ActivityIndicators) and click Next.
3. For Rules, select Branch (with branch set to master).
4. Click Finish.

### Usage

All indicators are encapsulated in the `Indicator` type. There are a number of indicator styles available, as shown in the gif above. You can add the `Default` style indicator to your layout with the following code snippet.
``` Swift
import SwiftUI

struct YourView: View {
    @State private var isLoading: Bool = true

    var body: some View {
        VStack {
            Indicator.Default(isAnimating: isLoading)
            
            Button("Toggle Loading") {
                self.isLoading.toggle()
            }
        }
    }
}
```

The types of indicator that are available are:
- `Default`
- `Continuous`
- `BallString`
- `Pulse`
- `Radar`

Each indicator also takes in an optional `color` parameter of type `Color` at the end its initializer. This is used to specify the color of the indicator. The default value of this parameter is the primary label color. The only exception to this is the `Pulse` type which cannot use transparent colors and instead uses the non-opaque label color of your platform. 

Another example
``` Swift
// Create a red 'Pulse' indicator
Indicator.Pulse(isAnimating: isAnimating, color: .red)
```
#### Resizing

By default most indicators take a size of 40x40 pixels. This can be customized by using the `resizable` modifier on the indicator directly. This modifier behaves similar to how `SwiftUI.Image`'s `resizable` modifier behaves, specifically, making the indicator take up all of the space that the parent offers it. This allows you to follow the `resizable` modifier with a `frame` modifier to set a custom size for the indicator. 

Here's a simple example:
``` Swift
// Create an indicator of size 100x100 pixels.
Indicator.Default(isAnimating: isAnimating)
    .resizable()
    .frame(width: 100, height: 100)
```

**Note:** At the moment, non-square sizes may be glitchy under specific circumstances. This should be fixed soon, but for now try to provide equal widths and heights to square the indicators, for best results.
