//
//  MissionariesCannibalProblem.swift
//  Tree Search
//
//  Created by Vitor Muniz on 08/09/17.
//  Copyright © 2017 alanrabelo. All rights reserved.
//

import Foundation


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
}
