//
//  UserDetailsView.swift
//  GitHubUsers
//
//  Created by Sean Chen on 2020/2/24.
//  Copyright © 2020 Sean Chen. All rights reserved.
//

import SwiftUI

struct UserDetailsView: View {
    @ObservedObject var remoteImage: RemoteImage
    @ObservedObject var remoteUserDetails: RemoteUserDetails
    
    let user: User
    
    init() {
        user = User.TestUser()
        remoteUserDetails = RemoteUserDetails(user: user)
        remoteImage = RemoteImage(imageUrl: user.avatar_url)
    }
    init(user: User) {
        self.user = user
        remoteUserDetails = RemoteUserDetails(user: user)
        remoteImage = RemoteImage(imageUrl: user.avatar_url)
    }
    
    var body: some View {
        VStack {
            remoteImage.image
                .resizable()
                .frame(width: 200.0, height: 200.0)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                .shadow(radius: 3)
            Text(remoteUserDetails.name)
            Text(remoteUserDetails.bio)
            Divider()
            .navigationBarTitle(Text("User details"))
            HStack {
                Image("EmptyUser")
                .resizable()
                .frame(width: 50.0, height: 50.0)
                VStack {
                    Text(remoteUserDetails.login)
                    ZStack {
                        Capsule()
                        .foregroundColor(.blue)
                      Text("STAFF")
                        .foregroundColor(.white)
                        .font(Font.system(size: 10))
                    }
                    .frame(width: 50, height: 15)
                    .opacity(user.site_admin ? 1.0 : 0.0)
                }
            }
            .padding()
            .frame(width: 250.0, height: 80.0)
            HStack {
                Image("Location")
                .resizable()
                .frame(width: 50.0, height: 50.0)
                Text(remoteUserDetails.location)
            }
            .padding()
            .frame(width: 250.0, height: 80.0)
            HStack {
                Image("Blog")
                .resizable()
                .frame(width: 50.0, height: 50.0)
                Text(remoteUserDetails.blog)
            }
            .padding()
            .frame(width: 250.0, height: 80.0)
            
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView()
    }
}
