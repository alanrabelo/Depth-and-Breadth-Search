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
    case dfsvisited
//    case iddfs
//    case dls
}


protocol Node: Equatable {
    
    associatedtype NodeValueType : Equatable
    
    var value : NodeValueType {get set}
    var parent : Self? {get set}
    func sucessors() -> [Self]
    
}





