//
//  HUD.swift
//  EasySwiftUI
//
//  Created by khoa on 22/03/2021.
//

import SwiftUI

public struct HUD<Content>: View where Content: View {
    let content: () -> Content

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        content()
        .frame(width: 120, height: 120)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.separator.opacity(0.8), lineWidth: 1)
        )
        .background(
            effect
        )
    }

    private var effect: some View {
        #if os(OSX)
        return VisualEffectView(material: .popover)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        #else
        return VisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        #endif
    }
}

public struct HUDLabel: View {
    let title: String
    let symbol: SFSymbol

    public init(title: String, symbol: SFSymbol) {
        self.title = title
        self.symbol = symbol
    }

    public var body: some View {
        HUD {
            VStack(spacing: 10) {
                Image(systemName: symbol.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.accentColor)
                    .frame(width: 40, height: 40)
                Text(title)
                    .minimumScaleFactor(0.8)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
            }
            .padding()
        }
    }
}
