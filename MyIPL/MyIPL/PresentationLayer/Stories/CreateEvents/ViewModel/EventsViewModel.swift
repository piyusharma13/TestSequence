//
//  EventsViewModel.swift
//  MyIPL
//
//  Created by Piyush Sharma on 03/03/21.
//

import Foundation

final class EventsViewModel
{
    static func simulateEvents( arrTeams : [Team]) -> [Team]?
    {
        //Split teams into a match and evaluate winners
        let result = arrTeams.chunked(into: 2)
        if result.count > 2, result.count.isMultiple(of: 2)
        {
            let winners = self.evaluateResuts(arrEvents: result)
            return winners
        }
        return nil
    }
    
    static func evaluateResuts(arrEvents : [[Team]]) -> [Team]
    {
        var arrTeams = [Team]()
        (0...(arrEvents.count - 1)).forEach { (index) in
            let teams = arrEvents[index]
            let winner = self.getWinner(teams: teams)
            arrTeams.append(winner)
        }
        return arrTeams
    }
    
    static func getWinner(teams : [Team]) -> Team
    {
        if teams.count == 2
        {
            let lower : UInt32 = 0
            let upper : UInt32 = 2
            let randomNumber = arc4random_uniform(upper - lower) + lower
            return teams[Int(randomNumber)]
        }
        else
        {
            return teams.last!
        }
    }
}
