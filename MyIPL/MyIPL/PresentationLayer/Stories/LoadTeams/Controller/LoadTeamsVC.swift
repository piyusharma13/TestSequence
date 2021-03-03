//
//  LoadTeamsVC.swift
//  MyIPL
//
//  Created by Piyush Sharma on 02/03/21.
//

import UIKit

class LoadTeamsVC: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tblTeams: UITableView!
    @IBOutlet weak var btnStart: UIButton!
    
    var teams = [Team]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My IPL Teams"
        
        autoreleasepool{
            if let arrTeams = TeamViewModel.createTeams(totalCount: 8), arrTeams.count > 0
            {
                teams = arrTeams
                tblTeams.reloadData()
            }
        }
    }
    
    @IBAction func btnStartAction(_ sender: Any)
    {
        if teams.count > 0, teams.count.isMultiple(of: 2)
        {
            let createEventsVC = CreateEventsVC(nibName: "CreateEventsVC", bundle: nil)
            createEventsVC.teams = teams
            self.navigationController?.pushViewController(createEventsVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        let team = teams[indexPath.row]
        cell.textLabel?.text = team.name
        cell.textLabel?.textAlignment = .center
        return cell
    }

}
