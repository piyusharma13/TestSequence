//
//  TeamViewModel.swift
//  MyIPL
//
//  Created by Piyush Sharma on 02/03/21.
//

import Foundation

final class TeamViewModel
{
    static func createTeams(totalCount : Int) -> [Team]?
    {
        if totalCount.isMultiple(of: 2)
        {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .spellOut
            var teams = [Team]()
            (0...(totalCount - 1)).forEach { (index) in
                let team = Team(teamID: index, name: "T - \(numberFormatter.string(from: NSNumber(value: index)) ?? "")")
                teams.append(team)
            }
            return teams
        }
        return nil
    }
}
