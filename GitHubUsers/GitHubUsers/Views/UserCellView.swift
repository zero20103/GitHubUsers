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
    
    init(user: User) {
        self.userCell = UserCellViewModel(user: user)
        remoteImage = RemoteImage(imageUrl: self.userCell.avatar_url)
        print(userCell.login)
    }
    
    var body: some View {
        HStack {
            Text("\(userCell.NumberOfItems)")
                .frame(width: 25.0)
            Image(uiImage: remoteImage.data.isEmpty ?UIImage(imageLiteralResourceName:"EmptyUser"):UIImage(data: remoteImage.data)!).resizable()
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

