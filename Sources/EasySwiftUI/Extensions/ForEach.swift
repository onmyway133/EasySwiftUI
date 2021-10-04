//
//  ForEach.swift
//  EasySwiftUI
//
//  Created by khoa on 04/10/2021.
//

import SwiftUI

public func ForEachWithIndex<
    Data: RandomAccessCollection,
    Content: View>(
    _ data: Data,
    @ViewBuilder content: @escaping (Data.Index, Data.Element) -> Content
) -> some View where Data.Element: Identifiable, Data.Element: Hashable {
    ForEach(Array(zip(data.indices, data)), id: \.1) { index, element in
        content(index, element)
    }
}
