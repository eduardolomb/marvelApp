//
//  Request.swift
//  marvelNetwork
//
//  Created by Eduardo Lombardi on 19/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import Foundation

public class Request {
public var charactersData: Characters?
private let limit = 20
public var offset = 10

func request() -> (Int, String) {
  guard let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?limit=\(limit)&offset=\(offset)&apikey=757948084785697b972e93938cc60c53") else { return (0, "could not unpack url") }
         URLSession.shared.dataTask(with: url) { (data, response
             , error) in
             guard let data = data else { return }
             do {
                 let decoder = JSONDecoder()
                 let charactersData = try decoder.decode(Characters.self, from: data)
                DispatchQueue.main.async {
                    self.charactersData = charactersData
                }
             } catch let err {
                 print("Error", err)
             }
             }.resume()
        return (0, "could not unpack data")
    }

}
