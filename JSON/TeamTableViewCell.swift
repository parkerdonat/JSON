//
//  TeamTableViewCell.swift
//  JSON
//
//  Created by Parker Donat on 9/15/17.
//  Copyright © 2017 Parker Donat. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    let placeHolder = UIImage(named: "noImage.png")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension TeamTableViewCell {
    func updateWith(teamMember: TeamMember) {
        name.text = [teamMember.firstName, teamMember.lastName].flatMap({$0}).joined(separator:" ")
        avatar.downloadedFrom(link: teamMember.avatar, placeHolder: placeHolder)
    }
}
