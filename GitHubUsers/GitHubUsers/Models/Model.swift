//
//  Model.swift
//  GitHubUsers
//
//  Created by Sean Chen on 2020/2/22.
//  Copyright © 2020 Sean Chen. All rights reserved.
//

import Foundation

class Model {
    var users : [User]
    
    
    init() {
        self.users = []
        
        let url = URL(string: "https://api.github.com/users")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            
            do {
               self.users = try JSONDecoder().decode([User].self, from: data)
               //print(self.users)
            }
            catch {
               print(error)
            }
        }
        task.resume()
    }
    
}
