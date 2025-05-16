//
//  Mutex.swift
//  PropertyBased
//
//  Created by Lennard Sprong on 04/05/2025.
//

#if canImport(Darwin)
import Darwin

/// A back-ported version of Mutex from the Synchronization library.
final class Mutex<Value: ~Copyable>: @unchecked Sendable {
    private nonisolated(unsafe) var _value: Value
    private nonisolated(unsafe) var lock = os_unfair_lock()
    
    init(_ value: consuming sending Value) {
        _value = value
    }
    
    func withLock<Result: ~Copyable, E: Error>(_ body: (inout sending Value) throws(E) -> sending Result) throws(E) -> sending Result {
        os_unfair_lock_lock(&lock)
        defer { os_unfair_lock_unlock(&lock) }
        return try body(&_value)
    }
}
#else
import Synchronization
typealias Mutex = Synchronization.Mutex
#endif
