//
//  main.swift
//  blind-searches
//
//  Created by Vitor Muniz on 04/09/17.
//  Copyright © 2017 Vitor Muniz. All rights reserved.
//

import Foundation



//Solving City problem

let citiesNodes = cities.keys.map { (cityname) -> City in
    return City(withValue: cityname)
}

var aradNode = citiesNodes.filter { (city) -> Bool in
    return city.value == CityName.Arad
}.first!

var bucharestNode = citiesNodes.filter { (city) -> Bool in
    return city.value == CityName.Bucharest
    }.first!

let problem = AnyProblem<City>(withInitialState: aradNode, andGoalState: bucharestNode, andSearchType: .bfs)

let agent = Agent(withProblem: problem)

print(agent.solution())

//Solving Aspirator problem

let aspNodes = aspStates.keys.map { (cityname) -> Aspirador in
    return Aspirador(withValue: cityname)
}

var leftDirtyDirty = aspNodes.filter { (city) -> Bool in
    return city.value == AspNames.LDD
    }.first!

var rightCleanClean = aspNodes.filter { (city) -> Bool in
    return city.value == AspNames.LCC
    }.first!


let aspproblem = AnyProblem<Aspirador>(withInitialState: leftDirtyDirty, andGoalState: rightCleanClean, andSearchType: .dfs)

let agentAsp = Agent(withProblem: aspproblem)
print(agentAsp.solution())
//let aspagent = Agent(withProblem: aspproblem)
//
//print(aspagent.solution())

