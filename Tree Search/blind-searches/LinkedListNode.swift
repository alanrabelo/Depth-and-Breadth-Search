//
//  LinkedListNode.swift
//  Cannibals and Missionaries
//
//  Created by Renan Trévia on 4/7/17.
//  Copyright © 2017 Renan Trévia. All rights reserved.
//

public class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}
