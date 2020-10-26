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

    public init(verticalPadding: CGFloat = 4, horizontalPadding: CGFloat = 8) {
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .background(configuration.isPressed ? Color.white.opacity(0.1) : Color.clear)
            .cornerRadius(2)
    }
}
