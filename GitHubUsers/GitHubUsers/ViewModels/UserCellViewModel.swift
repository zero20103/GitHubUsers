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
        
        let url = URL(string: user.avatar_url)!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.avatar_data = data
            }
        }.resume()
    }
    
    static func GetTest() -> UserCellViewModel{
        let user = User(login: "TestLogin", id: 0, node_id: "TestNodeID", avatar_url: "EmptyUser", gravatar_id: "TestGravatarID", url: "TestUrl", html_url: "TestHtmlUrl", followers_url: "TestFollowersUrl", following_url: "TestFollowingUrl", gists_url: "TestGistsUrl", starred_url: "TestStarredUrl", subscriptions_url: "TestSubscriptions", organizations_url: "TestOrganizationsUrl", repos_url: "TestReposUrl", events_url: "TestEventsUrl", received_events_url: "TestReceivedEventsUrl", type: "TestType", site_admin: true)
        
        
        return UserCellViewModel(user: user);
    }
}
