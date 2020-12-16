//
//  Binding.swift
//  
//
//  Created by khoa on 16/12/2020.
//

import SwiftUI

public extension Binding {
    func didSet(_ didSet: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                didSet(newValue)
            }
        )
    }
}
