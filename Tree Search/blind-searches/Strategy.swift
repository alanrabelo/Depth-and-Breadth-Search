//
//  Strategy.swift
//  blind-searches
//
//  Created by Vitor Muniz on 04/09/17.
//  Copyright © 2017 Vitor Muniz. All rights reserved.
//

import Foundation

protocol SearchStrategy {
    associatedtype StateType
    func execute(_ initialState:LinkedListNode<StateType>,_ goalState:LinkedListNode<StateType>) -> LinkedListNode<StateType>?
}

