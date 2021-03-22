//
//  Bindin.swift
//  EasySwiftUI
//
//  Created by khoa on 22/03/2021.
//

import SwiftUI

public extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}
