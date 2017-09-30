//
//  Fringeable.swift
//  Tree Search
//
//  Created by Alan Rabelo Martins on 30/09/2017.
//  Copyright © 2017 alanrabelo. All rights reserved.
//

import Foundation

protocol Fringeable {
    
    
    mutating func insert(_ element: Any)
    
    mutating func remove() -> Any?
    
}
