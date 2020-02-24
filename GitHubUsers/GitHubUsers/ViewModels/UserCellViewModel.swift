//
//  UserListViewModel.swift
//  GitHubUsers
//
//  Created by Sean Chen on 2020/2/22.
//  Copyright © 2020 Sean Chen. All rights reserved.
//

import Foundation

class UserCellViewModel {
    let avatar_url : String
    let login : String
    let site_admin : Bool
    let NumberOfItems : Int
    
    init(user:User) {
        avatar_url = user.avatar_url
        login = user.login
        site_admin = user.site_admin
        NumberOfItems = user.id
    }
}
