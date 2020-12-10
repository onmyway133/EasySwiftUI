//
//  File.swift
//  
//
//  Created by khoa on 26/10/2020.
//

import SwiftUI

public struct HighlightButtonStyle: ButtonStyle {
    let hPadding: CGFloat
    let vPadding: CGFloat
    let cornerRadius: CGFloat

    public init(
        h: CGFloat = 8,
        v: CGFloat = 4,
        cornerRadius: CGFloat = 4
    ) {
        self.hPadding = h
        self.vPadding = v
        self.cornerRadius = cornerRadius
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, hPadding)
            .padding(.vertical, vPadding)
            .background(configuration.isPressed ? Color.white.opacity(0.1) : Color.clear)
            .cornerRadius(cornerRadius)
    }
}
