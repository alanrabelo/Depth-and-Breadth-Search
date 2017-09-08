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
        return value.C == 0 && value.M == 0
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
        if c > m && m < 3 {
            return false
        }
        return true
    }

    func generateSucessors() -> [StateMC] {
        let operators = [(M:1, C:0),(M:1, C:1),(M:0, C:1),(M:0, C:2)]
        var generatedStates = [StateMC]()
        //TO DO: Refactor this part
        
        for i in 0..<operators.count {
            
            let m = operators[i].M
            let c = operators[i].C
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
    var initialState: StateType { get set}
    var goalState: StateType { get set}
    var searchType:SearchType { get set }
    func getSolution() -> [StateType]
}

extension Problem {
    func printSolution() {
        self.depthFirstSearch(initalNode: initialState, goalNode: goalState)
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
                    if !visited.contains(sucessor) {
                        edge.push(sucessor)
                    }
                }
            }
        }
    }
}

/*
    Missionaries and Cannibals problem is very famous in Artificial Intelligence because it
 was the subject of the first paper that approached problem formulation from an
 analytical viewpoint. The problem can be stated as follow. Three missionaries and three
 cannibals are on one side of a river, along with a boat that can hold one or two people. Now
 we have to find a way to get everyone to the other side, without ever leaving a group of
 missionaries in one place outnumbered by the cannibals in other side. The above problem can
 be solved by a graph search method. Here I represent the problem as a set of states and
 operators. States are snapshots of the world and operators are those which transform one state
 into another state. States can be mapped to nodes of a graph and operators are the edges of
 the graph.
 
 font : http://flipkarma.com/media_dir/main_documents/Misionaries_And_Cannibals_Report.pdf
 
 */


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
        return []
    }
    
    func printSolution() {
        self.depthFirstSearch(initalNode: initialState, goalNode: goalState)
    }
}




