//
//  Collection+Extensions.swift
//  Tree Search
//
//  Created by Vitor Muniz on 07/09/17.
//  Copyright © 2017 alanrabelo. All rights reserved.
//

import Foundation

extension Collection {
    /// Return a copy of `self` with its elements shuffled
    func shuffled() -> [Iterator.Element] {
        var list = Array(self)
        list.shuffle()
        return list
    }
}
