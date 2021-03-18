//
//  MyTextview.swift
//  EasySwiftUI
//
//  Created by khoa on 18/03/2021.
//

import SwiftUI

#if canImport(UIKit)
import UIKit

public struct MyTextView: UIViewRepresentable {
    @Binding
    var text: String

    public init(text: Binding<String>) {
        self._text = text
    }

    public final class Coordinator: NSObject, UITextViewDelegate {
        let parent: MyTextView

        public init(parent: MyTextView) {
            self.parent = parent
        }

        public func textViewDidChange(_ textView: UITextView) {
            if textView.text != parent.text {
                parent.text = textView.text
            }
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    public func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        view.smartQuotesType = .no
        view.smartDashesType = .no
        view.smartInsertDeleteType = .no
        view.font = UIFont.preferredFont(forTextStyle: .body)
        view.delegate = context.coordinator
        return view
    }

    public func updateUIView(_ uiView: UITextView, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
    }
}

#endif

#if canImport(AppKit)
import Combine
import AppKit

public struct MyTextView: NSViewRepresentable {
    public typealias NSViewType = NSScrollView

    @Binding
    var text: String
    @Binding
    var isFocus: Bool

    public init(
        text: Binding<String>,
        isFocus: Binding<Bool>
    ) {
        self._text = text
        self._isFocus = isFocus
    }


    public class Coordinator: NSObject, NSTextViewDelegate {
        let parent: MyTextView

        public init(parent: MyTextView) {
            self.parent = parent
        }

        public func textDidEndEditing(_ notification: Notification) {
            parent.isFocus = false
        }

        public func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else { return }
            if parent.text != textView.string {
                parent.text = textView.string
            }
        }
    }

    public func makeNSView(context: Context) -> NSViewType {
        let scrollView: NSScrollView = FocusTextView.scrollableTextView()
        let textView: NSTextView = scrollView.documentView as! FocusTextView

        textView.drawsBackground = false
        textView.textColor = NSColor.labelColor
        textView.font = NSFont.preferredFont(forTextStyle: .body, options: [:])
        textView.delegate = context.coordinator
        textView.isSelectable = true
        textView.isEditable = true

        return scrollView
    }

    public func updateNSView(_ nsView: NSViewType, context: Context) {
        guard let textView = nsView.documentView as? NSTextView else { return }

        DispatchQueue.main.async {
            textView.string = text
        }

        if let lineLimit = context.environment.lineLimit {
            textView.textContainer?.maximumNumberOfLines = lineLimit
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}

private class FocusTextView: NSTextView {
    var enablesScroll: Bool = true
    var onFocus: () -> Void = {}

    override func becomeFirstResponder() -> Bool {
        onFocus()
        return super.becomeFirstResponder()
    }

    override func scrollWheel(with event: NSEvent)
    {
        if enablesScroll {
            super.scrollWheel(with: event)
        } else {
            // 1st nextResponder is NSClipView
            // 2nd nextResponder is NSScrollView
            // 3rd nextResponder is NSResponder SwiftUIPlatformViewHost
            self.nextResponder?.nextResponder?.nextResponder?.scrollWheel(with: event)
        }
    }
}
#endif
