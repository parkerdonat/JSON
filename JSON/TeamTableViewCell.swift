//
//  TeamTableViewCell.swift
//  JSON
//
//  Created by Parker Donat on 9/22/17.
//  Copyright © 2017 Parker Donat. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    let placeHolder = UIImage(named: "noImage.png")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatar.layer.cornerRadius = 8
        avatar.clipsToBounds = true
    }
}

extension TeamTableViewCell {
    func updateWith(teamMember: TeamMember) {
        name.text = [teamMember.firstName, teamMember.lastName].flatMap({$0}).joined(separator:" ")
        avatar.downloadedFrom(link: teamMember.avatar, placeHolder: placeHolder)
    }
}
