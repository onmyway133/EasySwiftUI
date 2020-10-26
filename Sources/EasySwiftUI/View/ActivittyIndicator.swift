//
//  ActivittyIndicator.swift
//  Omnia
//
//  Created by khoa on 02/11/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(UIKit) && os(iOS)

import SwiftUI

@available(iOS 13.0, tvOS 13.0, *)
public struct ActivityIndicator: UIViewRepresentable {
    @Binding
    var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    public init(isAnimating: Binding<Bool>, style: UIActivityIndicatorView) {
        self._isAnimating = isAnimating
        self.style = style
    }

    public func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

#endif

#if canImport(AppKit) && os(macOS)

import SwiftUI

@available(OSX 10.15, *)
public struct ActivityIndicator: NSViewRepresentable {
    @Binding
    var isAnimating: Bool

    public init(isAnimating: Binding<Bool>) {
        self._isAnimating = isAnimating
    }

    public func makeNSView(context: NSViewRepresentableContext<ActivityIndicator>) -> NSProgressIndicator {
        let indicator = NSProgressIndicator(frame: .zero)
        indicator.style = .spinning
        indicator.controlTint = NSControlTint.blueControlTint
        return indicator
    }

    public func updateNSView(
        _ nsView: NSProgressIndicator,
        context: NSViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? nsView.startAnimation(nil) : nsView.stopAnimation(nil)
    }
}

#endif


