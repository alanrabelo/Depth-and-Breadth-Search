//
//  Problem.swift
//  Tree Search
//
//  Created by Vitor Muniz on 08/09/17.
//  Copyright © 2017 alanrabelo. All rights reserved.
//

import Foundation


protocol Problem {
    
    associatedtype StateType: Node
    
    var initialState: StateType { get set}
    var goalState: StateType { get set}
    var searchType:SearchType { get set }
    
}


class AnyProblem<T : Node>: Problem {
    
    typealias StateType = T

    var initialState: StateType
    
    var goalState: StateType
    
    var searchType: SearchType
    
    init(withInitialState initialState : StateType, andGoalState goalState : StateType, andSearchType searchType : SearchType) {
        self.initialState = initialState
        self.goalState = goalState
        self.searchType = searchType
    }
    
}



