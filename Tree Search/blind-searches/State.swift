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
    case other
}

protocol State:Equatable,CustomStringConvertible{
    associatedtype ValueType
    var value:ValueType { get }
    func isValid() -> Bool
    func isGoal() -> Bool
    func generateSucessors() -> [Self]
}

struct StateMC:State {
    typealias ValueType = (M:Int,C:Int,B:Int)
    var value:ValueType
    var ruleApplied: String
    
    func isGoal() -> Bool {
        return value.C == 0 && value.M == 0 && value.B == 1
     }
    
    func isValid() -> Bool {
        let c = value.C
        let m = value.M
        let b = value.B
        //first check the obvious
        if m < 0 || c < 0 || m > 3 || c > 3 || (b != 1 && b != -1) {
            return false
        }
        //more cannibals then missionaries on original shore
        if c > m && m > 0 {
            return false
        }
        //more cannibals then missionaries on other shore
        if c  < m && m < 3 {
            return false
        }
        return true
    }

    func generateSucessors() -> [StateMC] {
        let rules = [(M:1, C:0),(M:1, C:1),(M:0, C:1),(M:0, C:2)]
        var generatedStates = [StateMC]()
        //TO DO: Refactor this part
        
        for i in 0..<rules.count {
            let m = rules[i].M
            let c = rules[i].C
            let b = self.value.B
            
            let newM = self.value.M + (-1 * b * m)
            let newC = self.value.C + (-1 * b * c)
            let newB = (b * -1)
            let value:ValueType = (M:newM,C:newC,B:newB)
            let newState = StateMC(value: value, ruleApplied: (i + 1).description)
            generatedStates.append(newState)
        }
        let validStates =  generatedStates.filter({
            (state) -> Bool in
            return state.isValid()
        })
        
        return validStates
    }

    internal static func ==(lhs: StateMC, rhs: StateMC) -> Bool {
        return lhs.value == rhs.value
    }
    
    var description: String {
        return "C: \(value.C) M: \(value.M) B: \(value.B) + rule applied: \(ruleApplied)\n"
    }
}


protocol Problem{
    associatedtype StateType:State
    var initialState: StateType { get }
    var goalState: StateType { get }
    var searchType:SearchType { get set }
    func getSolution() -> [StateType]//retorna o nó que é o goal ou retorna nada
}

extension Problem {
    func printSolution() {
    
    }
}

extension Problem {
    func depthFirstSearch(initalNode initial: StateType,goalNode goal: StateType) {
        
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
                    print(!visited.contains(sucessor))
                    if !visited.contains(sucessor) {
                        edge.push(sucessor)
                    }
                }
            }
        }
        print(visited)
        print("don't find answer")
    }
    
    func breadthFirstSearch(initalNode initial: CityName,goalNode goal: CityName) {
        //    var path = Stack<Cities>()
        var edge : Queue<CityName> = Queue<CityName>()
        var visited = [CityName]()
        
        if initial == goal {
            print("Found goal in initial node")
        }
        
        edge.enqueue(initial)
        
        while !edge.isEmpty {
            if let parent = edge.dequeue() {
                print("visited \(parent.rawValue)")
                visited.append(parent)
                if parent == goal {
                    print("Found goal \(parent.rawValue)")
                    return
                }
                for city in cities[parent]!.shuffled() {
                    if !visited.contains(city) {
                        edge.enqueue(city)
                    }
                }
            }
        }
    }
    
    func recursiveDepthLimitedSearch(initialNode initial: CityName, goalNode goal:CityName, visitedCities visited:inout [CityName],withLimit limit: Int) -> CityName? {
        if !visited.contains(initial) {
            // print("visited \(initial.rawValue)")
            visited.append(initial)
            if initial == goal{
                //   print("Found goal \(initial.rawValue)")//remove this, beacause i will only use this to test
                return initial
            }else if limit > 0 {
                for city in cities[initial]!{
                    if let result = recursiveDepthLimitedSearch(initialNode: city,goalNode: goal,visitedCities: &visited,withLimit: limit - 1) {
                        return result
                    }
                }
            }
        }
        return nil
    }
    
    func iterativeDeepeningSearch(initialNode initial: CityName, goalNode goal:CityName){
        var visited =  [CityName]()
        var depth = 1
        var finish = false
        while !finish {
            if recursiveDepthLimitedSearch(initialNode: initial, goalNode: goal, visitedCities: &visited, withLimit: depth) != nil {
                finish = true
            }else{
                visited = []
                depth += 3
            }
        }
        for city in visited {
            print("visited \(city.rawValue)")
        }
    }
}

class MissionariesCannibalProblem:Problem {


    typealias StateType = StateMC
    var initialState:StateType
    var goalState:StateType
    var searchType: SearchType
    
    init(initalState inital:StateType,goalStateValue goal:StateType,searchType type:SearchType) {
        self.initialState = inital
        self.goalState = goal
        self.searchType = type
    }
    
    func getSolution() -> [StateType] {
//        let initial = LinkedListNode<StateType>(value: initialState)
//        let goal = LinkedListNode<StateType>(value: goalState)
//        switch searchType {
//        case .bfs:
//            return breadthFirstSearch
//        default:
//            return nil
//        }
        
        return []
    }
    
    func printSolution() {
        self.depthFirstSearch(initalNode: initialState, goalNode: goalState)
    }
}




