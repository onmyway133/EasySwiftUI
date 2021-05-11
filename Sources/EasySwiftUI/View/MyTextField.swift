//
//  MyTextField.swift
//  EasySwiftUI
//
//  Created by khoa on 18/03/2021.
//

import SwiftUI

#if os(OSX)
import AppKit

public struct MyTextField: NSViewRepresentable {
    @Binding
    var text: String
    let placeholder: String?
    let font: NSFont
    let alignment: NSTextAlignment

    public init(
        text: Binding<String>,
        placeholder: String? = nil,
        font: NSFont = NSFont.preferredFont(forTextStyle: .body, options: [:]),
        alignment: NSTextAlignment = .left
    ) {
        self._text = text
        self.placeholder = placeholder
        self.font = font
        self.alignment = alignment
    }

    public func makeNSView(context: Context) -> NSTextField {
        let tf = NSTextField()
        tf.focusRingType = .none
        tf.isBordered = false
        tf.drawsBackground = false
        tf.delegate = context.coordinator
        tf.font = self.font
        tf.alignment = alignment
        tf.placeholderString = placeholder
        return tf
    }

    public func updateNSView(_ nsView: NSTextField, context: Context) {
        if nsView.stringValue != text {
            nsView.stringValue = text
        }
    }

    public func makeCoordinator() -> MyTextField.Coordinator {
        Coordinator(parent: self)
    }

    public class Coordinator: NSObject, NSTextFieldDelegate  {
        let parent: MyTextField
        public init(parent: MyTextField) {
            self.parent = parent
        }

        public func controlTextDidChange(_ obj: Notification) {
            let textField = obj.object as! NSTextField
            parent.text = textField.stringValue
        }
    }
}

#endif
