//
//  MySearchField.swift
//  EasySwiftUI
//
//  Created by khoa on 18/03/2021.
//

#if canImport(AppKit)
import SwiftUI
import AppKit

public struct MySearchField: NSViewRepresentable {
    @Binding
    var text: String

    public init(text: Binding<String>) {
        self._text = text
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    public func makeNSView(context: Context) -> NSSearchField {
        let view = NSSearchField()
        view.delegate = context.coordinator
        return view
    }

    public func updateNSView(_ view: NSSearchField, context: Context) {
        if view.stringValue != text {
            view.stringValue = text
        }
    }

    public final class Coordinator: NSObject, NSSearchFieldDelegate {
        let parent: MySearchField

        public init(parent: MySearchField) {
            self.parent = parent
        }

        public func controlTextDidChange(_ obj: Notification) {
            guard let nsSearchField = obj.object as? NSSearchField else { return }
            parent.text = nsSearchField.stringValue
        }
    }
}

#endif
