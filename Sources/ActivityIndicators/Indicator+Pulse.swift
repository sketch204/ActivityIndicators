//
//  Indicator+Pulse.swift
//  ActivityIndicators
//
//  Created by Inal Gotov on 2020-01-11.
//  Copyright © 2020 Inal Gotov. All rights reserved.
//

import SwiftUI

extension Indicator {
    public struct Pulse: ActivityIndicator {
        public var isAnimating: Bool
        #if os(macOS)
        public var color = Color(NSColor.textColor)
        #elseif os(iOS)
        public var color = Color(UIColor.label)
        #endif
        
        /// The current scale factor of the pulsing circle.
        @State private var scaleEffect: CGFloat = 1
        /// The current scale factor of the pulsing circle.
        @State private var opacity: Double = 0
        /// The timer which drives the animation of this indicator.
        private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
        public var body: some View {
            ZStack {
                Circle()
                    .fill(self.color)
                    .scaleEffect(self.scaleEffect)
                    .opacity(self.opacity)
                    .mask(
                        GeometryReader { proxy in
                            Circle()
                                .stroke(Color.white, lineWidth: 50)
                                .padding(self.padding(proxy))
                        }
                    )

                GeometryReader { proxy in
                    Circle()
                        .fill(self.color)
                        .padding(self.padding(proxy))
                }
            }
            .frame(width: 60, height: 60)
            .onReceive(self.timer) { _ in
                // Reset
                if self.scaleEffect != 0 {
                    self.scaleEffect = 0
                    self.opacity = 1
                }
                
                // Animate
                if self.isAnimating {
                    withAnimation(Animation.easeOut(duration: 1)) {
                        self.scaleEffect = 1
                        self.opacity = 0
                    }
                }
            }
        }
        
        /// Returns the padding for the ball.
        /// - Parameter proxy: The GeometryProxy representing the container of this Activity Indicator.
        private func padding(_ proxy: GeometryProxy) -> CGFloat {
            self.minDimension(proxy) * 0.25
        }
        
        /// Creates a new Indicator of type Pulse of the given color (if given), binded to the given bool isAnimating property.
        /// - Parameters:
        ///   - isAnimating: A Binding to a Bool which controls whether or not this indicator is animating.
        ///   - color: An optional parameter which control the color of this indicator. The default value of this parameter is the label color.
        public init(isAnimating: Bool, color: Color? = nil) {
            self.isAnimating = isAnimating
            #if os(macOS)
            self.color = color ?? Color(NSColor.textColor)
            #elseif os(iOS)
            self.color = color ?? Color(UIColor.label)
            #endif
        }
    }

}

struct Pulse_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Indicator.Pulse(isAnimating: true)//, color: .yellow)
            Indicator.Pulse(isAnimating: false)
        }
    }
}
