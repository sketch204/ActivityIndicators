//
//  ActivityIndicator.swift
//  ActivityIndicators
//
//  Created by Inal Gotov on 2020-01-11.
//  Copyright © 2020 Inal Gotov. All rights reserved.
//

import SwiftUI

/// A container type for supported Indicators.
public enum Indicator {}

/// A protocol which defines an Activity Indicator and provides some utility functions.
public protocol ActivityIndicator: View {
    /// States whether or not this activity indicator should be animating.
    var isAnimating: Bool { get }
    
    /// The current color of the activity indicator.
    var color: Color { get }
    
    /// The default size of the indicator, or nil if the indicator needs to be resizable.
    var defaultSize: CGSize? { get set }
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
    
    /// A modifier which makes this indicator resizable. If this modifier is not followed by a .frame() modifier, then it will take up all of the the space offered to it.
    public func resizable() -> Self {
        var newView = self
        newView.defaultSize = nil
        return newView
    }
}
