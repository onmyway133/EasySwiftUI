//
//  Typealias.swift
//  EasySwiftUI
//
//  Created by khoa on 04/02/2020.
//

#if canImport(UIKit)
import UIKit
public typealias UXImage = UIImage
#elseif canImport(AppKit)
import AppKit
public typealias UXImage = NSImage
#elseif canImport(WatchKit)
import WatchKit
public typealias UXImage = UIImage
#endif
