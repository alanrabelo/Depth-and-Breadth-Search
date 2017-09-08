//
//  BreadthFirstSearch.swift
//  blind-searches
//
//  Created by Vitor Muniz on 04/09/17.
//  Copyright © 2017 Vitor Muniz. All rights reserved.
//

import Foundation

/*
class BreadthFirstSearch<StateType>:SearchStrategy where StateType:State{
    func execute(_ initialState:LinkedListNode<StateType>,_ goalState:LinkedListNode<StateType>) -> LinkedListNode<StateType>?{
        if initialState.value == goalState.value {
            return initialState
        }
        var frontier = Queue<StateType>()//
        //var explored = HashSet<StateType>()
        frontier.enqueue(initialState.value)
        while !frontier.isEmpty {
            let state = frontier.dequeue()
            //explored.insert(element: state!)
            
            let successors:[StateType] = state?.generateSucessors()
            
            for child in successors! {
//                if !explored.contains(element: child)  {
//                    if child == goalState {
//                        return child
//                    }
//                    frontier.enqueue(child)
//                }
            }
        }
        return nil
    }
}
*/
