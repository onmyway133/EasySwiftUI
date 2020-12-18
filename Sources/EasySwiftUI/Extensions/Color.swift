//
//  Color.swift
//  Omnia
//
//  Created by khoa on 14/11/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(SwiftUI)

import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public extension SwiftUI.Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )

        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}

#endif

#if canImport(UIKit)
extension Color {

    // MARK: - Text Colors
    static let lightText = Color(UIColor.lightText)
    static let darkText = Color(UIColor.darkText)
    static let placeholderText = Color(UIColor.placeholderText)

    // MARK: - Label Colors
    static let label = Color(UIColor.label)
    static let secondaryLabel = Color(UIColor.secondaryLabel)
    static let tertiaryLabel = Color(UIColor.tertiaryLabel)
    static let quaternaryLabel = Color(UIColor.quaternaryLabel)

    // MARK: - Background Colors
    static let systemBackground = Color(UIColor.systemBackground)
    static let secondarySystemBackground = Color(UIColor.secondarySystemBackground)
    static let tertiarySystemBackground = Color(UIColor.tertiarySystemBackground)

    // MARK: - Fill Colors
    static let systemFill = Color(UIColor.systemFill)
    static let secondarySystemFill = Color(UIColor.secondarySystemFill)
    static let tertiarySystemFill = Color(UIColor.tertiarySystemFill)
    static let quaternarySystemFill = Color(UIColor.quaternarySystemFill)

    // MARK: - Grouped Background Colors
    static let systemGroupedBackground = Color(UIColor.systemGroupedBackground)
    static let secondarySystemGroupedBackground = Color(UIColor.secondarySystemGroupedBackground)
    static let tertiarySystemGroupedBackground = Color(UIColor.tertiarySystemGroupedBackground)

    // MARK: - Gray Colors
    static let systemGray = Color(UIColor.systemGray)
    static let systemGray2 = Color(UIColor.systemGray2)
    static let systemGray3 = Color(UIColor.systemGray3)
    static let systemGray4 = Color(UIColor.systemGray4)
    static let systemGray5 = Color(UIColor.systemGray5)
    static let systemGray6 = Color(UIColor.systemGray6)

    // MARK: - Other Colors
    static let separator = Color(UIColor.separator)
    static let opaqueSeparator = Color(UIColor.opaqueSeparator)
    static let link = Color(UIColor.link)

    // MARK: System Colors
    static let systemBlue = Color(UIColor.systemBlue)
    static let systemPurple = Color(UIColor.systemPurple)
    static let systemGreen = Color(UIColor.systemGreen)
    static let systemYellow = Color(UIColor.systemYellow)
    static let systemOrange = Color(UIColor.systemOrange)
    static let systemPink = Color(UIColor.systemPink)
    static let systemRed = Color(UIColor.systemRed)
    static let systemTeal = Color(UIColor.systemTeal)
    static let systemIndigo = Color(UIColor.systemIndigo)
}
#endif

#if canImport(AppKit)
extension Color {
    // MARK: - Label Colors
    static let label = Color(NSColor.labelColor)
    static let secondaryLabel = Color(NSColor.secondaryLabelColor)
    static let tertiaryLabel = Color(NSColor.tertiaryLabelColor)
    static let quaternaryLabel = Color(NSColor.quaternaryLabelColor)

    // MARK: - Gray Colors
    static let systemGray = Color(NSColor.systemGray)

    // MARK: - Other Colors
    static let separator = Color(NSColor.separatorColor)
    static let link = Color(NSColor.linkColor)

    // MARK: System Colors
    static let systemBlue = Color(NSColor.systemBlue)
    static let systemPurple = Color(NSColor.systemPurple)
    static let systemGreen = Color(NSColor.systemGreen)
    static let systemYellow = Color(NSColor.systemYellow)
    static let systemOrange = Color(NSColor.systemOrange)
    static let systemPink = Color(NSColor.systemPink)
    static let systemRed = Color(NSColor.systemRed)
    static let systemTeal = Color(NSColor.systemTeal)
    static let systemIndigo = Color(NSColor.systemIndigo)
}
#endif
