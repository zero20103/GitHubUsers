//
//  RemoteImage.swift
//  GitHubUsers
//
//  Created by Sean Chen on 2020/2/23.
//  Copyright © 2020 Sean Chen. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class RemoteImage: ObservableObject {
    let didChange = ObservableObjectPublisher()
    
    @Published var image = Image(uiImage: UIImage(imageLiteralResourceName:"EmptyUser")) {
        didSet {
            didChange.send()
        }
    }
    
    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: UIImage(data: data)!)
            }
        }.resume()
    }
}
