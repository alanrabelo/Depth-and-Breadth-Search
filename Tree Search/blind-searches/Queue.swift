//
//  Queue.swift
//  Cannibals and Missionaries
//
//  Created by Renan Trévia on 4/7/17.
//  Copyright © 2017 Renan Trévia. All rights reserved.
//

public struct Queue<T> {
    
    typealias ElementType = T
    
    var array = [T]()
    
    mutating func insert(_ element: T) {
        array.append(element)

    }
    
    mutating func remove() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    
    public var front: T? {
        return array.first
    }
}
