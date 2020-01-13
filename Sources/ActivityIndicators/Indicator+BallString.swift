//
//  Indicator+BallString.swift
//  ActivityIndicators
//
//  Created by Inal Gotov on 2020-01-11.
//  Copyright © 2020 Inal Gotov. All rights reserved.
//

import SwiftUI

extension Indicator {
    public struct BallString: ActivityIndicator {
        @Binding public var isAnimating: Bool
        public var color = Color.primary
        
        /// The current rotation of the ball string.
        @State private var rotation: Double = 360
        /// The timer which drives the animation of this indicator.
        private let timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()
        /// The number of ball in the ball string.
        private let numOfBalls: Int = 7
        
        public var body: some View {
            GeometryReader { proxy in
                ForEach(1...self.numOfBalls, id: \.self) { index in
                    ZStack {
                        Circle()
                            .fill(self.color)
                            .frame(width: self.width(proxy),
                                   height: self.height(proxy))
                            .position(x: proxy.frame(in: .local).midX,
                                      y: proxy.frame(in: .local).minY + (self.height(proxy) / 2))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(1.0 - (Double(index) / Double(self.numOfBalls * 3)))
                    .rotationEffect(.degrees(self.rotation))
                    .animation(Animation.easeInOut(duration: 1).delay(Double(index) / 20))
                }
            }
            .frame(width: 40, height: 40)
            .animation(.none)
            .onReceive(self.timer) { _ in
                if self.isAnimating {
                    self.rotation += 360
                }
            }
        }
        
        /// Returns the width of a single ball in the ball string.
        /// - Parameter proxy: The GeometryProxy representing the container of this Activity Indicator.
        private func width(_ proxy: GeometryProxy) -> CGFloat {
            minDimension(proxy) * 0.07
        }
        
        /// Returns the height of a single ball in the ball string.
        /// - Parameter proxy: The GeometryProxy representing the container of this Activity Indicator.
        private func height(_ proxy: GeometryProxy) -> CGFloat {
            (minDimension(proxy) / 2) - (minDimension(proxy) * 0.25)
        }
        
        /// Creates a new Indicator of type BallString of the given color (if given), binded to the given bool isAnimating property.
        /// - Parameters:
        ///   - isAnimating: A Binding to a Bool which controls whether or not this indicator is animating.
        ///   - color: An optional parameter which control the color of this indicator. The default value of this parameter is the primary color.
        public init(isAnimating: Binding<Bool>, color: Color = .primary) {
            self._isAnimating = isAnimating
            self.color = color
        }
    }
}

struct BallString_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Indicator.BallString(isAnimating: .constant(true), color: .yellow)
            Indicator.BallString(isAnimating: .constant(false))
        }
    }
}
