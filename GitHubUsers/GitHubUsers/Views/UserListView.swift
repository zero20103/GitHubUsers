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
        self.users = [User.TestUser()]
    }
    init(users: [User]) {
        self.users = users
    }
    
    var body: some View {
        VStack {
            NavigationView{
                List(users, id: \.id) { user in
                    NavigationLink(destination: UserDetailsView(user: user)) {
                        UserCellView(user: user)
                    }
                }
                .navigationBarTitle(Text("Users"))
            }
        }
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
