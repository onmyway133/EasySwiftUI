//
//  PagerView.swift
//  EasySwiftUI
//
//  Created by khoa on 30/03/2021.
//

import SwiftUI

public struct PagerView<Content: View>: View {
    private let pageCount: Int
    private let content: Content

    @Binding
    var currentIndex: Int

    @GestureState
    private var translation: CGFloat = 0

    public init(
        pageCount: Int,
        currentIndex: Binding<Int>,
        @ViewBuilder content: () -> Content
    ) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
    }

    public var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )
                    .contentShape(Rectangle())
            }
            .frame(
                width: geometry.size.width,
                alignment: .leading
            )
            .offset(x: -CGFloat(self.currentIndex ) * geometry.size.width)
            .offset(x: self.translation)
            .animation(.interactiveSpring())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.width
                }.onEnded { value in
                    let offset = value.translation.width / geometry.size.width
                    let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                    self.currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
                }
            )
        }
    }
}



