//
//  StateMC.swift
//  Tree Search
//
//  Created by Vitor Muniz on 08/09/17.
//  Copyright © 2017 alanrabelo. All rights reserved.
//

import Foundation

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

