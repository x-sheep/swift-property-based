//
//  Shrink.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 14/05/2025.
//

public typealias Shrinker<T, Seq: Sequence<T>> = @Sendable (T) -> Seq
