//
//  Gen+Color.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 19/05/2025.
//

#if canImport(CoreGraphics)
import CoreGraphics

extension Gen where Value == CGColor {
    public static var cgColor: Generator<CGColor, Shrink.None<(CGFloat, CGFloat, CGFloat)>> {
        let float = Gen<CGFloat>.value(in: 0...1)
        return zip(float, float, float).map { t in
            CGColor(red: t.0, green: t.1, blue: t.2, alpha: 1)
        }.withoutShrink
    }
}
#endif

#if canImport(AppKit)
import AppKit

extension Gen where Value == NSColor {
    public static var nsColor: Generator<NSColor, Shrink.None<(CGFloat, CGFloat, CGFloat)>> {
        Gen<CGColor>.cgColor.compactMap(NSColor.init(cgColor:))
    }
}
#endif

#if canImport(UIKit)
import UIKit

extension Gen where Value == UIColor {
    public static var uiColor: Generator<UIColor, Shrink.None<(CGFloat, CGFloat, CGFloat)>> {
        Gen<CGColor>.cgColor.map(UIColor.init(cgColor:))
    }
}
#endif
