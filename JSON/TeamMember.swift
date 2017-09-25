//
//  Team.swift
//  JSON
//
//  Created by Parker Donat on 9/13/17.
//  Copyright © 2017 Parker Donat. All rights reserved.
//

import Foundation

class TeamMember {
    
    private let kID = "id"
    private let kFirstName = "firstName"
    private let kLastName = "lastName"
    private let kTitle = "title"
    private let kBio = "bio"
    private let kAvatar = "avatar"
    
    var id: String
    var firstName: String
    var lastName: String
    var title: String
    var bio: String
    var avatar: String
    
    init?(json: [String: AnyObject]) {
        guard let id = json[kID] as? String,
            let firstName = json[kFirstName] as? String,
            let lastName = json[kLastName] as? String,
            let title = json[kTitle] as? String,
            let bio = json[kBio] as? String,
            let avatar = json[kAvatar] as? String else { return nil }
                
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.title = title
        self.bio = bio
        self.avatar = avatar
    }
}
