//
//  TeamController.swift
//  JSON
//
//  Created by Parker Donat on 9/15/17.
//  Copyright © 2017 Parker Donat. All rights reserved.
//

import Foundation

class TeamController {
        
    static var team: [TeamMember] = []
    
    static func getTeamMembers() -> [TeamMember] {
        guard let path = Bundle.main.path(forResource: "team", ofType: "json") else { return [] }
        do {
            let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
            
            do {
                if let jsonResultArray: NSArray = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray, let resultsArray: [NSDictionary] = jsonResultArray as? [NSDictionary] {
                    
                    for string: NSDictionary in resultsArray {
                        if let teamMember = TeamMember(json: string as! [String : AnyObject]) {
                            team.append(teamMember)
                        }
                    }
                }
            }
        } catch {}
        return team
    }
}
