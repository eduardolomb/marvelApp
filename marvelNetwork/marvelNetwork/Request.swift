//
//  Request.swift
//  marvelNetwork
//
//  Created by Eduardo Lombardi on 19/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import Foundation


class Request {

    
    func request() {
        let unPackedurl = URL(string: "https://gateway.marvel.com:443/v1/public/characters?limit=10&offset=100&apikey=757948084785697b972e93938cc60c53")
        guard let url = unPackedurl else { return }
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
                print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
}
