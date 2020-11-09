//
//  File.swift
//  
//
//  Created by khoa on 26/10/2020.
//

import SwiftUI

public struct HighlightButtonStyle: ButtonStyle {
    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat
    let cornerRadius: CGFloat

    public init(
        horizontalPadding: CGFloat = 8,
        verticalPadding: CGFloat = 4,
        cornerRadius: CGFloat = 4
    ) {
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.cornerRadius = cornerRadius
    }

    public init(
        padding: CGFloat = 8,
        cornerRadius: CGFloat = 4
    ) {
        self.horizontalPadding = padding
        self.verticalPadding = padding
        self.cornerRadius = cornerRadius
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .background(configuration.isPressed ? Color.white.opacity(0.1) : Color.clear)
            .cornerRadius(cornerRadius)
    }
}
