//
//  Aspirador.swift
//  Tree Search
//
//  Created by Alan Rabelo Martins on 30/09/2017.
//  Copyright © 2017 alanrabelo. All rights reserved.
//

import Foundation


enum AspNames : String {
    case LDD = "LDD"
    case RDD = "RDD"
    case LCD = "LCD"
    case RCD = "RCD"
    case LDC = "LDC"
    case RDC = "RDC"
    case LCC = "LCC"
    case RCC = "RCC"
}
//LDD,LDD,RDD,LCD
//RDD,RDD,LDD,RDC
//LCD,LCD,LCD,RCD
//RCD,RCD,LCD,RCC
//LDC,LDC,RDC,LCC
//RDC,RDC,RDC,LDC
//LCC,LCC,LCC,RCC
//RCC,RCC,RCC,LCC



let aspStates:[AspNames:[AspNames]] = [.LDD:[.LDD,.RDD, .LCD],
                                    .RDD:[.RDD,.LDD, .RDC],
                                    .LCD:[.LCD,.LCD, .RCD],
                                    .RCD:[.RCD,.LCD, .RCC],
                                    .LDC:[.LDC,.RDC, .LCC],
                                    .RDC:[.RDC,.RDC, .LDC],
                                    .LCC:[.LCC,.LCC, .RCC],
                                    .RCC:[.RCC,.RCC, .LCC]
                                    ]



final class Aspirador : Node {
    
    
    typealias NodeValueType = AspNames
    typealias NodeType = Aspirador
    var parent: NodeType?
    var value: NodeValueType
    
    
    init(withValue value : NodeValueType) {
        self.value = value
    }
    
    func sucessors() -> [NodeType] {
        return (aspStates[self.value]?.map({ (cityName) -> NodeType in
            let sucessor = NodeType(withValue: Aspirador.NodeValueType(rawValue: cityName.rawValue)!)
            sucessor.parent = self
            return sucessor
        }))!
    }
    
    static func ==(lhs: Aspirador, rhs: Aspirador) -> Bool {
        return lhs.value == rhs.value
        
    }

    
    
}
