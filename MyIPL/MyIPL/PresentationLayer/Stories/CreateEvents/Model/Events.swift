//
//  Events.swift
//  MyIPL
//
//  Created by Piyush Sharma on 03/03/21.
//

import Foundation

class Events : Hashable
{
    static func == (lhs: Events, rhs: Events) -> Bool
    {
        lhs.hashValue == rhs.hashValue
    }
    
    var eventID : Int
    var teams : [Team]
    
    init(eventID : Int, teams : [Team])
    {
        self.eventID = eventID
        self.teams = teams
    }
    
    func hash(into hasher: inout Hasher)
    {
        hasher.combine(eventID)
        hasher.combine(teams)
    }
}
