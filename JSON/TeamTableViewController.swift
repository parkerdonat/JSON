//
//  TeamTableViewController.swift
//  JSON
//
//  Created by Parker Donat on 9/15/17.
//  Copyright © 2017 Parker Donat. All rights reserved.
//

import UIKit

class TeamTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    var team: [TeamMember] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        team = TeamController.getTeamMembers()
        self.myTableView.contentInset = UIEdgeInsetsMake(5, 0, 0, 0);
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Mark: DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TeamController.team.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
        
        let member = TeamController.team[indexPath.row]
        cell.updateWith(teamMember: member)
        
        return cell
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "memberDetail" {
            let detailViewController = segue.destination as! TeamDetailViewController
            if let cell = sender as? TeamTableViewCell, let indexPath = self.myTableView.indexPath(for: cell) {
                let teamMember = team[indexPath.row]
                detailViewController.teamMember = teamMember
            }
        }
    }
}
