//
//  User.swift
//  GitHubUsers
//
//  Created by Sean Chen on 2020/2/22.
//  Copyright © 2020 Sean Chen. All rights reserved.
//

import Foundation

struct User : Hashable, Codable, Identifiable {
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
    
    //details
    let name : String?
    let company : String?
    let blog : String?
    let location : String?
    let email : String?
    let hireable : String?
    let bio : String?
    let public_repos : Int?
    let public_gists : Int?
    let followers : Int?
    let following : Int?
    let created_at : String?
    let updated_at : String?
    
    static func EmptyUser() -> User {
        return User(login: "", id: 0, node_id: "", avatar_url: "EmptyUser", gravatar_id: "", url: "", html_url: "", followers_url: "", following_url: "", gists_url: "", starred_url: "", subscriptions_url: "", organizations_url: "", repos_url: "", events_url: "", received_events_url: "", type: "", site_admin: false, name: nil, company: nil, blog: nil, location: nil, email: nil, hireable: nil, bio: nil, public_repos: nil, public_gists: nil, followers: nil, following: nil, created_at: nil, updated_at: nil)
    }
    static func TestUser() -> User {
        return User(login: "TestLogin", id: 0, node_id: "TestNodeID", avatar_url: "EmptyUser", gravatar_id: "TestGravatarID", url: "TestUrl", html_url: "TestHtmlUrl", followers_url: "TestFollowersUrl", following_url: "TestFollowingUrl", gists_url: "TestGistsUrl", starred_url: "TestStarredUrl", subscriptions_url: "TestSubscriptions", organizations_url: "TestOrganizationsUrl", repos_url: "TestReposUrl", events_url: "TestEventsUrl", received_events_url: "TestReceivedEventsUrl", type: "TestType", site_admin: true, name: nil, company: nil, blog: nil, location: nil, email: nil, hireable: nil, bio: nil, public_repos: nil, public_gists: nil, followers: nil, following: nil, created_at: nil, updated_at: nil)
    }
}
