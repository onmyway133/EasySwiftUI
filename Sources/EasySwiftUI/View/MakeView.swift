//
//  MakeView.swift
//  EasySwiftUI
//
//  Created by khoa on 22/05/2020.
//

import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct MakeView<Content: View>: View {
    let content: Content

    public init(@ViewBuilder make: () -> Content) {
        self.content = make()
    }

    public var body: some View {
        content
    }
}
