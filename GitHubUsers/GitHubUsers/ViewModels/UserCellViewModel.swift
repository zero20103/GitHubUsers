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
    var avatar_data : Data
    let login : String
    let site_admin : Bool
    let NumberOfItems : Int
    
    init(user:User) {
        avatar_url = user.avatar_url
        avatar_data = Data()
        login = user.login
        site_admin = user.site_admin
        NumberOfItems = user.id
    }
}
