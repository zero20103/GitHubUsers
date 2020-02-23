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
    let didChange = PassthroughSubject<Data, Never>()
    
    var data = Data(){
        didSet {
            didChange.send(data)
        }
    }
    
    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
