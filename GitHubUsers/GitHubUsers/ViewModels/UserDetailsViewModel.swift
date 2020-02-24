//
//  UserDetailsViewModel.swift
//  GitHubUsers
//
//  Created by Sean Chen on 2020/2/24.
//  Copyright © 2020 Sean Chen. All rights reserved.
//

import Foundation

class UserDetailsViewModel {
    let avatar_url : String
    let name : String?
    let bio : String?
    let login : String?
    let site_admin : Bool?
    let location : String?
    let blog : String?
    
    init(user: User) {
        avatar_url = user.avatar_url
        name = user.name
        bio = user.bio
        login = user.login
        site_admin = user.site_admin
        location = user.location
        blog = user.blog
    }
}
