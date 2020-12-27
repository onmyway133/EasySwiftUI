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

    init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }

    @available(iOS 14.0, OSX 11.0, *)
    var isLight: Bool {
        guard
            let components = cgColor?.components,
            components.count >= 3
        else { return false }

        let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000

        return brightness >= 0.5
    }
}

#endif

#if canImport(UIKit)
import UIKit

public extension Color {

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
import AppKit
public extension Color {
    static func dynamic(dark: Int, light: Int) -> Color {
        return NSAppearance.current.isDarkMode ? Color(hex: dark) : Color(hex: light)
    }

    // MARK: - Text Colors

    static let placeholderText = Color(NSColor.placeholderTextColor)

    // MARK: - Label Colors
    static let label = Color(NSColor.labelColor)
    static let secondaryLabel = Color(NSColor.secondaryLabelColor)
    static let tertiaryLabel = Color(NSColor.tertiaryLabelColor)
    static let quaternaryLabel = Color(NSColor.quaternaryLabelColor)

    // MARK: - Gray Colors
    static let systemGray = Color(NSColor.systemGray)
    static let systemGray2 = Color.dynamic(dark: 0x636366FF, light: 0xAEAEB2FF)
    static let systemGray3 = Color.dynamic(dark: 0x48484AFF, light: 0xC7C7CCFF)
    static let systemGray4 = Color.dynamic(dark: 0x3A3A3CFF, light: 0xD1D1D6FF)
    static let systemGray5 = Color.dynamic(dark: 0x2C2C2EFF, light: 0xE5E5EAFF)
    static let systemGray6 = Color.dynamic(dark: 0x1C1C1EFF, light: 0xF2F2F7FF)

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
