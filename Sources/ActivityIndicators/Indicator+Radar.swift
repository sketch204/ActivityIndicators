//
//  Indicator+Radar.swift
//  ActivityIndicators
//
//  Created by Inal Gotov on 2020-01-11.
//  Copyright © 2020 Inal Gotov. All rights reserved.
//

import SwiftUI

extension Indicator {
    public struct Radar: ActivityIndicator {
        @Binding public var isAnimating: Bool
        public var color = Color.primary
        
        /// The index of the currently animating ball.
        @State private var currentIndex: Int = -1
        /// The timer which drives the animation of this indicator.
        private let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
        
        public var body: some View {
            GeometryReader { proxy in
                HStack(spacing: 0) {
                    ForEach(0...2, id: \.self) { index in
                        Circle()
                            .fill(self.color)
                            .padding(self.padding(proxy))
                            .scaleEffect(self.scaleEffect(for: index))
                            .animation(.easeInOut(duration: 0.3))
                    }
                }
            }
            .frame(width: 120, height: 40)
            .onReceive(timer) { _ in
                if self.isAnimating {
                    self.currentIndex = (self.currentIndex + 1) % 3
                }
                else if self.currentIndex != -1 {
                    self.currentIndex = -1
                }
            }
        }
        
        /// Returns the padding for each ball of the indicator.
        /// - Parameter proxy: The GeometryProxy representing the container of this Activity Indicator.
        public func padding(_ proxy: GeometryProxy) -> CGFloat {
            self.maxDimension(proxy) * 0.075
        }
        
        /// Returns the current scale factor for the given index of a ball.
        /// - Parameter index: The index of the ball for which you want the scale factor.
        public func scaleEffect(for index: Int) -> CGFloat {
            return index == currentIndex ? 1.5 : 1.0
        }
    }
}

struct Indicator_Radar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Indicator.Radar(isAnimating: .constant(true), color: .yellow)
            Indicator.Radar(isAnimating: .constant(false))
        }
    }
}
