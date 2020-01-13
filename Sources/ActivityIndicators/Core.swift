//
//  ActivityIndicator.swift
//  ActivityIndicators
//
//  Created by Inal Gotov on 2020-01-11.
//  Copyright © 2020 Inal Gotov. All rights reserved.
//

import SwiftUI

/// A container type for supported Indicators.
enum Indicator {}

/// A protocol which defines an Activity Indicator and provides some utility functions.
protocol ActivityIndicator: View {
    /// States whether or not this activity indicator should be animating.
    var isAnimating: Bool { get }
    
    /// The current color of the activity indicator.
    var color: Color { get }
}

extension ActivityIndicator {
    
    /// Returns the minimum between the width and the height of the given GeometryProxy.
    /// - Parameter proxy: The GeometryProxy representing the container of this Activity Indicator.
    internal func minDimension(_ proxy: GeometryProxy) -> CGFloat {
        min(proxy.size.width, proxy.size.height)
    }
    
    /// Returns the maximum between the width and the height of the given GeometryProxy.
    /// - Parameter proxy: The GeometryProxy representing the container of this Activity Indicator.
    internal func maxDimension(_ proxy: GeometryProxy) -> CGFloat {
        max(proxy.size.width, proxy.size.height)
    }
}
