//
//  Tooltip.swift
//  EasySwiftUI
//
//  Created by khoa on 28/03/2020.
//

#if canImport(SwiftUI) && canImport(AppKit)

import SwiftUI
import AppKit

public struct ToolTip: NSViewRepresentable {
    let toolTip: String

    public init(_ toolTip: String) {
        self.toolTip = toolTip
    }

    public func makeNSView(context: NSViewRepresentableContext<ToolTip>) -> NSView {
        let view = NSView()
        view.toolTip = toolTip
        return view
    }

    public func updateNSView(_ nsView: NSView, context: NSViewRepresentableContext<ToolTip>) {
        nsView.toolTip = toolTip
    }
}

#endif
