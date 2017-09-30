//
//  Stack.swift
//  Tree Search
//
//  Created by Vitor Muniz on 07/09/17.
//  Copyright © 2017 alanrabelo. All rights reserved.
//

import Foundation

public struct Stack<T> {
    
    typealias ElementType = T

    var array = [T]()
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    mutating func insert(_ element: T) {
        array.insert(element, at: 0)
    }
    
    mutating func remove() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public var front: T? {
        return array.first
    }
}
