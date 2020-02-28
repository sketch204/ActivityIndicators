//
//  ContinuousIndicator.swift
//  ActivityIndicators
//
//  Created by Inal Gotov on 2020-01-11.
//  Copyright © 2020 Inal Gotov. All rights reserved.
//

import SwiftUI

extension Indicator {
    public struct Continuous: ActivityIndicator {
        public var isAnimating: Bool
        public var color = Color.primary
        
        /// The current rotation of the ball string.
        @State private var rotation: Double = 360
        /// The timer which drives the animation of this indicator.
        private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        public var defaultSize: CGSize? = CGSize(width: 40, height: 40)
        
        public var body: some View {
            GeometryReader { proxy in
                Circle()
                    .strokeBorder(
                        AngularGradient(gradient: Gradient(colors: [self.color.opacity(0), self.color]),
                                        center: .center,
                                        startAngle: .degrees(-90),
                                        endAngle: .degrees(270)),
                        lineWidth: self.lineWidth(proxy)
                    )
            }
            .rotationEffect(.degrees(self.rotation))
            .frame(width: 40, height: 40)
            .onReceive(self.timer) { _ in
                if self.isAnimating {
                    withAnimation(Animation.linear) {
                        self.rotation += 36
                    }
                }
            }
        }
        
        /// Returns the line width of the indicator.
        /// - Parameter proxy: The GeometryProxy representing the container of this Activity Indicator.
        private func lineWidth(_ proxy: GeometryProxy) -> CGFloat {
            self.minDimension(proxy) * 0.1
        }
        
        /// Creates a new Indicator of type Continuous of the given color (if given), binded to the given bool isAnimating property.
        /// - Parameters:
        ///   - isAnimating: A Binding to a Bool which controls whether or not this indicator is animating.
        ///   - color: An optional parameter which control the color of this indicator. The default value of this parameter is the primary color.
        public init(isAnimating: Bool = true, color: Color = .primary) {
            self.isAnimating = isAnimating
            self.color = color
        }
    }
}

struct ContinuousIndicator_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Indicator.Continuous(isAnimating: true, color: .yellow)
            Indicator.Continuous(isAnimating: false)
        }
    }
}
