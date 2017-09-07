//
//  main.swift
//  blind-searches
//
//  Created by Vitor Muniz on 04/09/17.
//  Copyright © 2017 Vitor Muniz. All rights reserved.
//

import Foundation

extension MutableCollection where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != j {
                swap(&self[i], &self[j])
            }
        }
    }
}

extension Collection {
    /// Return a copy of `self` with its elements shuffled
    func shuffled() -> [Iterator.Element] {
        var list = Array(self)
        list.shuffle()
        return list
    }
}

enum Cities:String {
    case Oradea = "Oradea"
    case Zerind = "Zerind"
    case Arad = "Arad"
    case Sibiu = "Sibiu"
    case Timisoara = "Timisoara"
    case Lugoj = "Lugoj"
    case Mehadia = "Mehadia"
    case Dobreta = "Dobreta"
    case Craiova = "Craiova"
    case Pitesti = "Pitesti"
    case Vilcea = "Vilcea"
    case Fagaras = "Fagaras"
    case Bucharest = "Bucharest"
    case Giurgiu =  "Giurgiu"
    case Urziceni = "Urziceni"
    case Hirsova = "Hirsova"
    case Vaslui = "Vaslui"
    case Iasi = "Iasi"
    case Neamt = "Neamt"
    case Eforie = "Eforie"
}


//sucessors
let cities:[Cities:[Cities]] = [.Oradea:[.Zerind,.Sibiu],
                                .Zerind:[.Oradea,.Arad],
                                .Arad:[.Sibiu,.Zerind,.Timisoara],
                                .Sibiu:[.Fagaras,.Vilcea,.Oradea,.Arad],
                                .Timisoara:[.Arad,.Lugoj],
                                .Lugoj:[.Timisoara,.Mehadia],
                                .Mehadia:[.Lugoj,.Dobreta],
                                .Dobreta:[.Mehadia,.Craiova],
                                .Craiova:[.Dobreta,.Vilcea,.Pitesti],
                                .Pitesti:[.Craiova,.Vilcea,.Bucharest],
                                .Vilcea:[.Pitesti,.Sibiu],
                                .Fagaras:[.Sibiu,.Bucharest],
                                .Bucharest:[.Fagaras,.Pitesti,.Giurgiu,.Urziceni],
                                .Urziceni:[.Bucharest,.Hirsova,.Vaslui],
                                .Hirsova:[.Urziceni,.Eforie],
                                .Eforie:[.Hirsova],
                                .Vaslui:[.Urziceni,.Iasi],
                                .Iasi:[.Vaslui,.Neamt],
                                .Neamt:[.Iasi]]
//


func depthFirstSearch(initalNode initial: Cities,goalNode goal: Cities) {
    
//    var path = Stack<Cities>()
    var edge : Stack<Cities> = Stack<Cities>()
    var visited = [Cities]()
    
    if initial == goal {
        print("Found goal in initial node")
    }
    
    edge.push(initial)

    
    while !edge.isEmpty {
        
        if let parent = edge.pop() {
            
            visited.append(parent)
            print("visited \(parent.rawValue)")
            
            if parent == goal {
                print("Found goal \(parent.rawValue)")
                return
            }
            for city in cities[parent]!.shuffled() {
                if !visited.contains(city) {
                    edge.push(city)
                }
            }
        }
    }
}

depthFirstSearch(initalNode: Cities.Oradea, goalNode: Cities.Bucharest)


