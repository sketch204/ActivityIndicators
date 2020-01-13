# ActivityIndicators

Use this small library to add a simple activity indicators to your `SwiftUI` apps!



### Installation

The preferred way of installing this library is through the Swift Package Manager.

1. In Xcode, open your project and navigate to File → Swift Packages → Add Package Dependency...
2. Paste the repository URL (https://github.com/sketch204/ActivityIndicators) and click Next.
3. For Rules, select Branch (with branch set to master).
4. Click Finish.

### Usage

All indictors are encapsulated in the `Indicator` struct. You can add a `Default` style indicator to your layout with the following snippet.
``` Swift
import SwiftUI

struct YourView: View {
    @State private var isLoading: Bool = false

    var body: some View {
        VStack {
            Indicator.Default(isAnimating: $isLoading)
            
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

Each indicator also takes in an option `color` parameter at the end, of type `Color`, which is used to specify the color of the indicator. The default value of that parameter is the default label color of the current platform. 

This snippet creates an indicator with the `Pulse` animation colored red.
``` Swift
Indicator.Pulse(isAnimating: $isAnimating, color: .red)
```
