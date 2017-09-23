//
//  main.swift
//  blind-searches
//
//  Created by Vitor Muniz on 04/09/17.
//  Copyright © 2017 Vitor Muniz. All rights reserved.
//

import Foundation

enum CityName:String {
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

let cities:[CityName:[CityName]] = [.Oradea:[.Zerind,.Sibiu],
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

func depthFirstSearch(initalNode initial: CityName,goalNode goal: CityName) {
    
    var edge : Stack<CityName> = Stack<CityName>()
    var visited = [CityName]()
    
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
//depthFirstSearch(initalNode: .Oradea, goalNode: .Bucharest)
//breadthFirstSearch(initalNode: .Oradea, goalNode: .Bucharest)
//var visited = [CityName]()
//let result = recursiveDepthLimitedSearch(initialNode: .Oradea, goalNode: .Bucharest,visitedCities:&visited,withLimit:5)
//print("\(result?.rawValue ?? "not found")")
//iterativeDeepeningSearch(initialNode: .Oradea, goalNode: .Bucharest)
let initialState = StateMC(value: (C:3,M:3,B:1), ruleApplied: "NONE")
let goalState = StateMC(value: (C:0,M:0,B:-1), ruleApplied: "NONE")

let problem = MissionariesCannibalProblem(initalState: initialState, goalStateValue: goalState, searchType: .dls)

problem.printSolution()
