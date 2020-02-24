//
//  UserCell.swift
//  GitHubUsers
//
//  Created by Sean Chen on 2020/2/23.
//  Copyright © 2020 Sean Chen. All rights reserved.
//

import SwiftUI

struct UserCellView: View {
    @ObservedObject var remoteImage: RemoteImage
    var userCell: UserCellViewModel
    
    init() {
        let user = User.TestUser()
        self.userCell = UserCellViewModel(user: user)
        remoteImage = RemoteImage(imageUrl: user.avatar_url)
    }
    init(user: User) {
        self.userCell = UserCellViewModel(user: user)
        remoteImage = RemoteImage(imageUrl: user.avatar_url)
    }
    
    var body: some View {
        HStack {
            Text("\(userCell.NumberOfItems)")
                .frame(width: 25.0)
            remoteImage.image
                .resizable()
                .frame(width: 50.0, height: 50.0)
                .clipShape(Circle())
            /*.overlay(
                Circle().stroke(Color.white, lineWidth: 3))
            .shadow(radius: 3)*/
            VStack(alignment: .leading) {
                Text(userCell.login)
                ZStack {
                    Capsule()
                    .foregroundColor(.blue)
                  Text("STAFF")
                    .foregroundColor(.white)
                    .font(Font.system(size: 10))
                }
                .frame(width: 50, height: 15)
                .opacity(userCell.site_admin ? 1.0 : 0.0)
            }
        }
        .padding(.all, 3.0)
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        UserCellView()
    }
}

