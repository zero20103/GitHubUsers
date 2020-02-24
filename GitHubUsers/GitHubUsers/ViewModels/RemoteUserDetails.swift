//
//  RemoteUserDetails.swift
//  GitHubUsers
//
//  Created by Sean Chen on 2020/2/24.
//  Copyright © 2020 Sean Chen. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class RemoteUserDetails: ObservableObject {
    let didChange = ObservableObjectPublisher()
    @Published var avatar_url : String { didSet { didChange.send() } }
    @Published var name : String { didSet { didChange.send() } }
    @Published var bio : String { didSet { didChange.send() } }
    @Published var login : String { didSet { didChange.send() } }
    @Published var site_admin : Bool { didSet { didChange.send() } }
    @Published var location : String { didSet { didChange.send() } }
    @Published var blog : String { didSet { didChange.send() } }
    
    init() {
        let user = User.EmptyUser()
        avatar_url = user.avatar_url
        name = user.name ?? ""
        bio = user.bio ?? ""
        login = user.login
        site_admin = user.site_admin
        location = user.location ?? ""
        blog = user.blog ?? ""
    }
        
    init(user: User) {
        self.avatar_url = user.avatar_url
        self.name = user.name ?? ""
        self.bio = user.bio ?? ""
        self.login = user.login
        self.site_admin = user.site_admin
        self.location = user.location ?? ""
        self.blog = user.blog ?? ""
        
        guard let url = URL(string: user.url) else { return }
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    self.avatar_url = user.avatar_url
                    self.name = user.name ?? ""
                    self.bio = user.bio ?? ""
                    self.login = user.login
                    self.site_admin = user.site_admin
                    self.location = user.location ?? ""
                    self.blog = user.blog ?? ""
                    //print(userDetails)
                }
                catch {
                    print("\(url):\(error)")
                }
            }
        }.resume()
    }
}
