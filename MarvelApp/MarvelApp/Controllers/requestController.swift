//
//  requestController.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 23/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import Foundation
import marvelNetwork

class RequestController {
        
    var offset = 0
    
    func getData(completion:@escaping ([Heroes]) -> Void) {
        let request:Request = Request()
        request.offset = self.offset
        request.request() { [weak self] result in
            self?.offset += 1
            let heroes = result.data?.results ?? []
            self?.offset = (self?.offset ?? 0) * (result.data?.limit ?? 1)
            var trueHeroes: [Heroes] = []
            for hero in heroes ?? [] {
                if let name = hero.name,
                    let image = hero.thumbnail?.path,
                    let ext = hero.thumbnail?.ext {
                    trueHeroes.append(Heroes(name: name, image: image + "." + ext, favorite: false))
                }
            }
            completion(trueHeroes ?? [])
        }
    }
}
