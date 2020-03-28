//
//  Wrap.swift
//  EasySwiftUI
//
//  Created by khoa on 28/03/2020.
//

// https://www.swiftbysundell.com/tips/inline-wrapping-of-uikit-or-appkit-views-within-swiftui/

#if canImport(SwiftUI) && canImport(UIKit)

import SwiftUI
import UIKit

public struct Wrap<Wrapped: UIView>: UIViewRepresentable {
    typealias Updater = (Wrapped, Context) -> Void

    var makeView: () -> Wrapped
    var update: (Wrapped, Context) -> Void

    public init(
        _ makeView: @escaping @autoclosure () -> Wrapped,
         updater update: @escaping Updater
    ) {
        self.makeView = makeView
        self.update = update
    }

    public func makeUIView(context: Context) -> Wrapped {
        makeView()
    }

    public func updateUIView(_ view: Wrapped, context: Context) {
        update(view, context)
    }
}

#endif

#if canImport(SwiftUI) && canImport(AppKit)

import SwiftUI
import AppKit

public struct Wrap<Wrapped: NSView>: NSViewRepresentable {
    public typealias Updater = (Wrapped, Context) -> Void

    var makeView: () -> Wrapped
    var update: (Wrapped, Context) -> Void

    public init(
        _ makeView: @escaping @autoclosure () -> Wrapped,
         updater update: @escaping Updater
    ) {
        self.makeView = makeView
        self.update = update
    }

    public func makeNSView(context: Context) -> Wrapped {
        makeView()
    }

    public func updateNSView(_ nsView: Wrapped, context: Context) {
         update(nsView, context)
    }
}

#endif
