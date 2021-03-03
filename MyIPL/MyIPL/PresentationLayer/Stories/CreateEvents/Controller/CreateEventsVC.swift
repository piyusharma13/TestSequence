//
//  CreateEventsVC.swift
//  MyIPL
//
//  Created by Piyush Sharma on 03/03/21.
//

import UIKit

class CreateEventsVC: UIViewController, UITableViewDataSource
{
    @IBOutlet weak var tblTeams: UITableView!
    @IBOutlet weak var btnStart: UIButton!

    var teams = [Team]()
    
    var events : [[Team]]?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        tblTeams.register(UINib(nibName: "CreateEventCell", bundle: nil), forCellReuseIdentifier: "CreateEventCell")
        tblTeams.rowHeight = UITableView.automaticDimension
        tblTeams.estimatedRowHeight = UIScreen.main.bounds.size.height * 0.06
        if teams.count > 0, teams.count.isMultiple(of: 2)
        {
            teams.shuffle()
            events = teams.chunked(into: 2)
            tblTeams.reloadData()
        }
    }
    
    private func setBottomButtonTitle()
    {
        if teams.count == 1
        {
            btnStart.setTitle("Restart", for: .normal)
            btnStart.setTitle("Restart", for: .highlighted)
        }
        else
        {
            btnStart.setTitle("Simulate", for: .normal)
            btnStart.setTitle("Simulate", for: .highlighted)
        }
    }

    @IBAction func btnSimulateEventAction(_ sender: Any) {
        
        let result = teams.chunked(into: 2)
        switch result.count {
        case 1:
            let arrTeams = EventsViewModel.getWinner(teams: teams)
            teams = [arrTeams]
        case 2:
            let arrTeams = EventsViewModel.evaluateResuts(arrEvents: result)
            teams = arrTeams
        default:
            if let arrTeams = EventsViewModel.simulateEvents(arrTeams: teams)
            {
                teams = arrTeams
            }
        }
        
        events = teams.chunked(into: 2)
        
        tblTeams.reloadData()
        
        if teams.count == 1, let team = teams.last
        {
            showAlert(for: team)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        var sectionName: String = ""
        if let arrEvents = events, arrEvents.count > 0
        {
            sectionName = "Event"
        }
        return sectionName
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let arrEvents = events, arrEvents.count > 0
        {
            let teams = arrEvents[section]
            return teams.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreateEventCell") as? CreateEventCell ?? CreateEventCell(style: .default, reuseIdentifier: "CreateEventCell")
        
        if let arrEvents = events, arrEvents.count > 0
        {
            let team = arrEvents[indexPath.section][indexPath.row]
            cell.lblTeamName.text = team.name
        }
        cell.lblTeamName.textAlignment = .center
        return cell
    }
    
    private func showAlert( for winner : Team )
    {
        let alert = UIAlertController(title: "IPL Ended", message: "\(winner.name) scored first position", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Restart IPL", style: .default, handler: { (action) in
            self.navigationController?.popViewController(animated: true)
        }))

        self.present(alert, animated: true)
    }
}
