//
//  MakeView.swift
//  EasySwiftUI
//
//  Created by khoa on 22/05/2020.
//

#if canImport(SwiftUI)

import SwiftUI

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public struct MakeView: View {
    let make: () -> AnyView

    public init(make: @escaping () -> AnyView) {
        self.make = make
    }

    public var body: some View {
        make()
    }
}

#endif
