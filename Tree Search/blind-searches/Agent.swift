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


class Agent : AgentDelegate {
    
    typealias ProblemClass = CityProblem
    typealias NodeType = ProblemClass.StateType
    var problem : ProblemClass
    
    var fringedfs = Stack<City>()
    var fringebfs = Queue<City>()

    init(withProblem problem : ProblemClass) {
        self.problem = problem
    }
    
    func solution() -> String {
        
        switch problem.searchType {
        case .bfs:
            if let path = bfs() {
                for city in path {
                    print(city.value)
                }
            }
        case .dfs:
            if let path = dfs() {
                for city in path {
                    print(city.value)
                }
            }
        }
        
        
        return ""
    }
    
    func dfs() -> [NodeType]? {
        
        let firstNode = self.problem.initialState
        
        if firstNode.value == self.problem.goalState.value {
            return [firstNode]
        } else {
            for state in firstNode.sucessors() {
                state.parent = firstNode
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
                    return path
                    
                } else {
                    for state in currentNode.sucessors() {
                        state.parent = currentNode
                        self.fringedfs.insert(state)
                    }
                    
                    print("Fringe has \(self.fringedfs.count)")

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
                state.parent = firstNode
                self.fringebfs.insert(state)
            }
        }
        
        while !self.fringebfs.isEmpty {
            if var currentNode = self.fringebfs.remove() {
                
                if currentNode.value == self.problem.goalState.value {
                    
                    print("Fringe has \(self.fringebfs.count)")
                    var path = [NodeType]()
                    
                    while currentNode.parent != nil {
                        path.insert(currentNode, at: 0)
                        currentNode = currentNode.parent!
                    }
                    path.insert(currentNode, at: 0)
                    return path
                    
                } else {
                    for state in currentNode.sucessors() {
                        state.parent = currentNode
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

class Agent2 : AgentDelegate {
    
    typealias ProblemClass = AspProblem
    typealias NodeType = ProblemClass.StateType
    var problem : ProblemClass
    
    var fringedfs = Stack<Aspirador>()
    var fringebfs = Queue<Aspirador>()
    
    init(withProblem problem : ProblemClass) {
        self.problem = problem
    }
    
    func solution() -> String {
        
        switch problem.searchType {
        case .bfs:
            if let path = bfs() {
                for city in path {
                    print(city.value)
                }
            }
        case .dfs:
            if let path = dfs() {
                for city in path {
                    print(city.value)
                }
            }
        }
        
        
        return ""
    }
    
    func dfs() -> [NodeType]? {
        
        let firstNode = self.problem.initialState
        
        if firstNode.value == self.problem.goalState.value {
            return [firstNode]
        } else {
            for state in firstNode.sucessors() {
                state.parent = firstNode
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
                    return path
                    
                } else {
                    for state in currentNode.sucessors() {
                        state.parent = currentNode
                        self.fringedfs.insert(state)
                    }
                    
                    print("Fringe has \(self.fringedfs.count)")
                    
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
                state.parent = firstNode
                self.fringebfs.insert(state)
            }
        }
        
        while !self.fringebfs.isEmpty {
            if var currentNode = self.fringebfs.remove() {
                
                if currentNode.value == self.problem.goalState.value {
                    
                    print("Fringe has \(self.fringebfs.count)")
                    var path = [NodeType]()
                    
                    while currentNode.parent != nil {
                        path.insert(currentNode, at: 0)
                        currentNode = currentNode.parent!
                    }
                    path.insert(currentNode, at: 0)
                    return path
                    
                } else {
                    for state in currentNode.sucessors() {
                        state.parent = currentNode
                        self.fringebfs.insert(state)
                    }
                }
                
                
                
            }
            
            
        }
        
        return nil
        
    }
}
