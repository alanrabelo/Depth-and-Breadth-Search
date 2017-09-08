//
//  State.swift
//  blind-searches
//
//  Created by Vitor Muniz on 04/09/17.
//  Copyright © 2017 Vitor Muniz. All rights reserved.
//

import Foundation

enum SearchType {
    case bfs
    case dfs
    case iddfs
    case dls
}

protocol State:Equatable,CustomStringConvertible{
    associatedtype ValueType
    var value:ValueType { get }
    func isValid() -> Bool
    func isGoal() -> Bool
    func generateSucessors() -> [Self]
}




