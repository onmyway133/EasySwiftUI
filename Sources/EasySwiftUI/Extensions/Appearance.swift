//
//  File.swift
//  
//
//  Created by khoa on 18/12/2020.
//

#if os(OSX)
import AppKit

public extension NSAppearance {
    var isDarkMode: Bool {
        if self.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua {
            return true
        } else {
            return false
        }
    }
}
#endif
