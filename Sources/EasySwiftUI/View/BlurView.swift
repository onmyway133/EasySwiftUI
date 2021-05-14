//
//  BlurView.swift
//  EasySwiftUI
//
//  Created by khoa on 14/05/2021.
//

import SwiftUI

#if os(iOS)
public struct BlurView: UIViewRepresentable {
    public init(style: UIBlurEffect.Style) {
        self.style = style
    }
    
    private let style: UIBlurEffect.Style
    
    public func makeUIView(context: Context) -> UIView {
        let effect = UIBlurEffect(style: style)
        let view = UIVisualEffectView(effect: effect)
        return view
    }
    
    public  func updateUIView(_ uiView: UIView, context: Context) {}
}
#endif
