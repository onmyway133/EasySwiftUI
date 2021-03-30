//
//  PagerView.swift
//  EasySwiftUI
//
//  Created by khoa on 30/03/2021.
//


import SwiftUI

// https://gist.github.com/mecid/e0d4d6652ccc8b5737449a01ee8cbc6f
// https://swiftwithmajid.com/2019/12/25/building-pager-view-in-swiftui/
public struct PagerView<Content: View>: View {
    let pageCount: Int
    let onDone: () -> Void
    let content: Content

    @Binding
    var currentIndex: Int

    @GestureState
    private var translation: CGFloat = 0

    public init(
        pageCount: Int,
        currentIndex: Binding<Int>,
        onDone: @escaping () -> Void,
        @ViewBuilder content: () -> Content
    ) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.onDone = onDone
        self.content = content()
    }

    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                HStack(spacing: 0) {
                    self.content.frame(width: geometry.size.width)
                }
                .frame(width: geometry.size.width, alignment: .leading)
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

                footer
                navigation
            }
        }
    }

    private var footer: some View {
        VStack {
            Spacer()
            button
                .padding(.bottom, 8)
            pageControl
        }
        .padding(.bottom, 16)
    }

    private var pageControl: some View {
        HStack {
            ForEach(0..<self.pageCount, id: \.self) { index in
                Circle()
                    .fill(index == self.currentIndex ? Color.accentColor : Color.secondary)
                    .frame(width: 8, height: 8)
            }
        }
    }

    private var button: some View {
        let text = currentIndex == pageCount - 1 ? "Start" : "Next"
        return Button(action: onButton) {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.accentColor)
                .frame(width: 240, height: 32)
                .overlay(
                    Text(text.uppercased())
                        .bold()
                        .foregroundColor(Color.white)
                        .animation(nil)
                )
        }
        .buttonStyle(BorderlessButtonStyle())
    }

    private var navigation: some View {
        VStack {
            Spacer()
            HStack {
                makeButton(action: onPrevious, symbol: .chevronLeft)
                Spacer()
                makeButton(action: onNext, symbol: .chevronRight)
            }
            .padding(.horizontal, 6)
            Spacer()
        }
    }

    private func makeButton(action: @escaping () -> Void, symbol: SFSymbol) -> some View {
        Button(action: action) {
            Image(systemName: symbol.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 10, height: 10)
                .foregroundColor(Color.secondary)
        }
        .buttonStyle(HighlightButtonStyle(h: 4, v: 4, cornerRadius: 2))
    }

    private func onButton() {
        if currentIndex == pageCount - 1 {
            onDone()
        } else {
            onNext()
        }
    }

    private func onPrevious() {
        withAnimation(Animation.easeInOut.speed(0.2)) {
            currentIndex = (currentIndex - 1 + pageCount) % pageCount
        }
    }

    private func onNext() {
        withAnimation(Animation.easeInOut.speed(0.2)) {
            currentIndex = (currentIndex + 1) % pageCount
        }
    }
}
