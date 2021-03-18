//
//  MyTextField.swift
//  EasySwiftUI
//
//  Created by khoa on 18/03/2021.
//

import SwiftUI

#if canImport(AppKit)
import AppKit

public struct MyTextField: NSViewRepresentable {
    @Binding
    var text: String

    public init(text: Binding<String>) {
        self._text = text
    }

    public func makeNSView(context: Context) -> NSTextField {
        let tf = NSTextField()
        tf.focusRingType = .none
        tf.isBordered = false
        tf.drawsBackground = false
        tf.delegate = context.coordinator
        tf.font = NSFont.preferredFont(forTextStyle: .body, options: [:])
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
