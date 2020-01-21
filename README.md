<H1 align="center">ActivityIndicators</H1>

<p align="center">Use this small library to add a simple activity indicator to your `SwiftUI` apps!</p>
<p align="center">
    <img src="https://github.com/sketch204/ActivityIndicators/blob/master/demo.gif" align="center"/>
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
