//
//  OnboardPagerView.swift
//  EasySwiftUI
//
//  Created by khoa on 30/03/2021.
//

import SwiftUI

public struct OnboardPageItem: Identifiable {
    public let id = UUID()

    let title: String
    let subtitle: String
    let image: String
    let size: CGSize?

    public init(
        title: String,
        subtitle: String,
        image: String,
        size: CGSize? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.size = size
    }
}

public struct OnboardView: View {
    let items: [OnboardPageItem]
    let onDone: () -> Void

    public init(
        items: [OnboardPageItem],
        onDone: @escaping () -> Void
    ) {
        self.items = items
        self.onDone = onDone
    }

    public var body: some View {
        OnboardPagerView(pageCount: items.count, onDone: onDone) {
            ForEach(items) { item in
                OnboardPageView(item: item)
            }
        }
    }
}

public struct OnboardPageView: View {
    let item: OnboardPageItem
    
    public init(item: OnboardPageItem) {
        self.item = item
    }

    public var body: some View {
        VStack {
            Text(item.title)
                .font(.title)
                .padding(.bottom, 16)
                .padding(.horizontal, 16)

            Text(item.subtitle)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.secondary)
                .padding(.horizontal, 24)
                .padding(.bottom, 32)

            Group {
                if let size = item.size {
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(
                            width: size.width,
                            height: size.height
                        )
                } else {
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .cornerRadius(8)
                }
            }
        }
    }
}


public struct OnboardPagerView<Content: View>: View {
    private let pageCount: Int
    private let onDone: () -> Void
    private let content: () -> Content

    @State
    private var currentIndex = 0

    public init(
        pageCount: Int,
        onDone: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.pageCount = pageCount
        self.onDone = onDone
        self.content = content
    }

    public var body: some View {
        VStack {
            ZStack {
                PagerView(
                    pageCount: pageCount,
                    currentIndex: $currentIndex,
                    content: content
                )

                navigation
            }
            .padding(.top, 40)

            footer
        }
    }

    private var footer: some View {
        VStack(spacing: 12) {
            button
            pageControl
        }
        .padding(.bottom, 16)
    }

    private var pageControl: some View {
        HStack {
            ForEach(0 ..< self.pageCount, id: \.self) { index in
                Circle()
                    .fill(index == self.currentIndex ? Color.accentColor : Color.secondary)
                    .frame(width: 8, height: 8)
                    .animation(nil)
            }
        }
    }

    @ViewBuilder
    private var button: some View {
        if currentIndex == pageCount - 1 {
            doneButton
        } else {
            nextButton
        }
    }

    private var nextButton: some View {
        Button(action: onNext) {
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color.accentColor)
                .frame(width: 240, height: 32)
                .overlay(
                    Text("Next".uppercased())
                        .bold()
                )
        }
        .buttonStyle(BorderlessButtonStyle())
    }

    private var doneButton: some View {
        Button(action: onDone) {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.accentColor)
                .frame(width: 240, height: 32)
                .overlay(
                    Text("Start".uppercased())
                        .bold()
                        .foregroundColor(Color.white)
                )
        }
        .buttonStyle(BorderlessButtonStyle())
    }

    private var navigation: some View {
        VStack {
            Spacer()
            HStack {
                navigateButton(action: onPrevious, symbol: .chevronLeft)
                Spacer()
                navigateButton(action: onNext, symbol: .chevronRight)
            }
            .padding(.horizontal, 6)
            Spacer()
        }
    }

    private func navigateButton(action: @escaping () -> Void, symbol: SFSymbol) -> some View {
        Button(action: action) {
            Image(systemName: symbol.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 10, height: 10)
                .foregroundColor(Color.secondary)
        }
        .buttonStyle(HighlightButtonStyle(h: 4, v: 4, cornerRadius: 2))
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
