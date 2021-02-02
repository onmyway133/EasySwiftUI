//
//  IfLet.swift
//  Omnia
//
//  Created by khoa on 13/11/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct IfLet<T, Content: View>: View {
    let value: T?
    let content: (T) -> Content

    public init(_ value: T?, @ViewBuilder content: @escaping (T) -> Content) {
        self.value = value
        self.content = content
    }

    public var body: some View {
        if let value = value {
            content(value)
        }
    }
}
