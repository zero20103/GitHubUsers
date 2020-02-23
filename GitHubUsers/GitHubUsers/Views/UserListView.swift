//
//  UserList.swift
//  GitHubUsers
//
//  Created by Sean Chen on 2020/2/23.
//  Copyright © 2020 Sean Chen. All rights reserved.
//

import SwiftUI

struct UserListView: View {
    let users: [User]
    
    init() {
        self.users = []
    }
    init(users: [User]) {
        self.users = users
    }
    
    var body: some View {
        VStack {
            Text("Users")
            List(users, id: \.id) { user in
                UserCellView(user: user)
            }
        }
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
