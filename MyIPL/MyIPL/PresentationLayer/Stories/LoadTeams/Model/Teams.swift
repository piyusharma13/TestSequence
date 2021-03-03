//
//  Teams.swift
//  MyIPL
//
//  Created by Piyush Sharma on 02/03/21.
//

import Foundation

class Team : Hashable
{
    static func == (lhs: Team, rhs: Team) -> Bool
    {
        lhs.hashValue == rhs.hashValue
    }
    
    var teamID : Int
    var name : String
    
    init(teamID : Int, name : String)
    {
        self.name = name
        self.teamID = teamID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(teamID)
        hasher.combine(name)
    }
}
