//
//  User.swift
//  GitHubUsers
//
//  Created by Sean Chen on 2020/2/22.
//  Copyright © 2020 Sean Chen. All rights reserved.
//

import Foundation

struct User : Identifiable,Codable {
    let login : String
    let id : Int
    let node_id : String
    let avatar_url : String
    let gravatar_id : String
    let url : String
    let html_url : String
    let followers_url : String
    let following_url : String
    let gists_url : String
    let starred_url : String
    let subscriptions_url : String
    let organizations_url : String
    let repos_url : String
    let events_url : String
    let received_events_url : String
    let type : String
    let site_admin : Bool
}