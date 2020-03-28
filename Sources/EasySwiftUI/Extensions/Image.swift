//
//  Image.swift
//  Omnia
//
//  Created by khoa on 29/10/2019.
//  Copyright © 2019 Khoa Pham. All rights reserved.
//

#if canImport(SwiftUI)

import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public extension SwiftUI.Image {
    func styleFit() -> some View {
        return self
            .resizable()
            .aspectRatio(contentMode: .fit)
    }

    func styleButton() -> some View {
        return self
        .resizable()
        .frame(width: 20, height: 20)
    }
}

#endif
