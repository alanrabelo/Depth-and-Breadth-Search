//
//  Problem.swift
//  Tree Search
//
//  Created by Vitor Muniz on 08/09/17.
//  Copyright © 2017 alanrabelo. All rights reserved.
//

import Foundation


protocol Problem{
    associatedtype StateType:State
    var initialState: StateType { get set}
    var goalState: StateType { get set}
    var searchType:SearchType { get set }
    func getSolution() -> [StateType]
}

extension Problem {
    func printSolution() {
        switch self.searchType {
        case .bfs:
            self.breadthFirstSearch(initalNode: initialState, goalNode: goalState)
        case .dfs:
            self.depthFirstSearch(initalNode: initialState, goalNode: goalState)
        case .dls:
            var visiteds = [StateType]()
            let result = self.recursiveDepthLimitedSearch(initialNode: initialState, goalNode: goalState, withLimit: 10)
            
        case .iddfs:
            self.iterativeDeepeningSearch(initialNode: initialState, goalNode: goalState)
            
        }
    }
}

extension Problem {
    func depthFirstSearch(initalNode initial: StateType,goalNode goal: StateType){
        
        var edge : Stack<StateType> = Stack<StateType>()
        var visited = [StateType]()
        
        if initial == goal {
            print("Found goal in initial node")
        }
        
        edge.push(initial)
        
        while !edge.isEmpty {
            
            if let parent = edge.pop() {
                
                visited.append(parent)
                print("\(parent.description)")
                
                if parent == goal {
                    print("Found goal \(parent.description)")
                    return
                }
                
                let sucessors = parent.generateSucessors()
                
                for sucessor in sucessors {
                    if !visited.contains(sucessor) {
                        edge.push(sucessor)
                    }
                }
            }
        }
    }
    
    
    func breadthFirstSearch(initalNode initial: StateType,goalNode goal: StateType) {
        
        var edge : Queue<StateType> = Queue<StateType>()
        
        if initial == goal {
            print("Found goal in initial node")
        }
        
        edge.enqueue(initial)
        
        while !edge.isEmpty {
            
            if let parent = edge.dequeue() {
                
                
                print("\(parent.description)")
                
                if parent == goal {
                    print("Found goal \(parent.description)")
                    return
                }
                
                let sucessors = parent.generateSucessors()
                
                for sucessor in sucessors {
                        edge.enqueue(sucessor)
                }
            }
        }
    }
    
    
    func recursiveDepthLimitedSearch(initialNode node: StateType, goalNode goal:StateType,withLimit limit: Int) -> StateType? {
        print("visited \(node.description)")
        if node == goal{
            print("Found goal \(node.description)")
            return node
        }else if limit > 0 {
            
            let sucessors = node.generateSucessors()
            for sucessor in sucessors{
                if let result = recursiveDepthLimitedSearch(initialNode: sucessor,goalNode: goal,withLimit: limit - 1) {
                        return result
                }
            }
        }
        return nil
    }
    
    
    
    func iterativeDeepeningSearch(initialNode node: StateType, goalNode goal:StateType){
        var depth = 1
        var finish = false
        while !finish {
            print("depth = \(depth)")
            if recursiveDepthLimitedSearch(initialNode: node, goalNode: goal, withLimit: depth) != nil {
                finish = true
            }else{
                depth += 3
                print("not found")
            }
        }
    }
}
