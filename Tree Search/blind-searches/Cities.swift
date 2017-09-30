//
//  Cities.swift
//  Tree Search
//
//  Created by Alan Rabelo Martins on 23/09/17.
//  Copyright © 2017 alanrabelo. All rights reserved.
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



final class City : Node {

    
    
    typealias NodeValueType = CityName
    typealias NodeType = City
    var parent: NodeType?
    var value: NodeValueType
    
    
    init(withValue value : NodeValueType) {
        self.value = value
    }
    
    func sucessors() -> [NodeType] {
        return (cities[self.value]?.map({ (cityName) -> NodeType in
            let sucessor = NodeType(withValue: City.NodeValueType(rawValue: cityName.rawValue)!)
            sucessor.parent = self
            return sucessor
            
        }))!
    }
    
    
    static func ==(lhs: City, rhs: City) -> Bool {
        return lhs.value == rhs.value
    }
 
    
}
