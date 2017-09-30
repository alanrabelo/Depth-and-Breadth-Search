//
//  Agent.swift
//  Tree Search
//
//  Created by Alan Rabelo Martins on 23/09/17.
//  Copyright © 2017 alanrabelo. All rights reserved.
//

import Foundation

protocol AgentDelegate {
    
    associatedtype ProblemClass : Problem
    
    var problem : ProblemClass {get set}
    
    
    func solution() -> String
    
}


class Agent<AnyProblem : Problem> : AgentDelegate {
    
    typealias ProblemClass = AnyProblem
    typealias NodeType = ProblemClass.StateType
    var problem : ProblemClass
    
    var fringedfs = Stack<AnyProblem.StateType>()
    var fringebfs = Queue<AnyProblem.StateType>()

    init(withProblem problem : ProblemClass) {
        self.problem = problem
    }
    
    func solution() -> String {
        
        let path : [NodeType]?
        
        switch problem.searchType {
        case .bfs:
            path = bfs()
        case .dfs:
            path = dfs()
        case .dfsvisited:
            path = dfs(allowVisitHistory: true)
        }
    
        if let path = path {
            for city in path {
                print(city.value)
            }
        }
        
        
        return ""
    }
    
    func dfs(allowVisitHistory : Bool = false) -> [NodeType]? {
        
        let firstNode = self.problem.initialState
        
        if firstNode.value == self.problem.goalState.value {
            return [firstNode]
        } else {
            for state in firstNode.sucessors() {
                self.fringedfs.insert(state)
            }
        }
        
        while !self.fringedfs.isEmpty {

            if var currentNode = self.fringedfs.remove() {
                
                if currentNode.value == self.problem.goalState.value {
                    
                    var path = [NodeType]()

                    while currentNode.parent != nil {
                        path.insert(currentNode, at: 0)
                        currentNode = currentNode.parent!
                    }
                    path.insert(currentNode, at: 0)
                    print("Fringe has \(self.fringedfs.count)")

                    return path
                    
                } else {
                    for state in currentNode.sucessors() {
                        if allowVisitHistory == true && self.fringedfs.array.contains(state) {
                            continue
                        }
                        
                        self.fringedfs.insert(state)

                    }
                    

                }
                
                
                
            }
            
            
        }
        
        return nil
        
    }
    
    func bfs() -> [NodeType]? {
        
        let firstNode = self.problem.initialState
        
        if firstNode.value == self.problem.goalState.value {
            return [firstNode]
        } else {
            for state in firstNode.sucessors() {
                self.fringebfs.insert(state)
            }
        }
        
        while !self.fringebfs.isEmpty {
            if var currentNode = self.fringebfs.remove() {
                
                if currentNode.value == self.problem.goalState.value {
                    
                    var path = [NodeType]()
                    
                    while currentNode.parent != nil {
                        path.insert(currentNode, at: 0)
                        currentNode = currentNode.parent!
                    }
                    path.insert(currentNode, at: 0)
                    print("Fringe has \(self.fringebfs.count)")

                    return path
                    
                } else {
                    for state in currentNode.sucessors() {
                        self.fringebfs.insert(state)
                    }
                }
                
                
                
            }
            
            
        }
        
        return nil
        
    }
}


extension Node {
    func fullPath() -> String  {
        
        if let parent = self.parent {
            return("\(self.value) <- \(parent.fullPath())")
        } else {
            return "\(self.value)"
        }
        
    }
}

