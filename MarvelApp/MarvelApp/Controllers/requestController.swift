//
//  requestController.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 23/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import Foundation
import marvelNetwork
import CoreData
import UIKit
import MarvelDataBase

class RequestController {
        
    var offset = 0
    var database = MarvelDataBase.RequestData()
    
    func getDataFromNetwork(completion:@escaping ([Heroes]) -> Void) {
        let request:Request = Request()
        request.offset = self.offset
        request.request() { [weak self] result in
            self?.offset += 1
            let heroes = result.data?.results ?? []
            self?.offset = (self?.offset ?? 0) * (result.data?.limit ?? 1)
            var trueHeroes: [Heroes] = []
            for hero in heroes {
                if let name = hero.name,
                    let image = hero.thumbnail?.path,
                    let ext = hero.thumbnail?.ext,
                    let description = hero.description,
                    let id = hero.id {
                    let hero = Heroes()
                    hero.name = name
                    hero.image = image + "." +  ext
                    hero.id = id
                    hero.favorite = false
                    trueHeroes.append(hero)
                }
            }
            completion(trueHeroes)
        }
    }
    
    
    func getDataFromCoreData(completion: ([Heroes]) -> Void) {
        
        database.getDataFromCoreData(completion: { [weak self] result in
            var favoriteHeroes:[Heroes] = []
            for data in result {
                if let name = data.value(forKey: "name") as? String,
                let image = data.value(forKey: "image")as? String,
                let id = data.value(forKey: "id") as? Int64 {
                let hero = Heroes()
                    hero.id = Int(id)
                    hero.image = image
                    hero.name = name
                    hero.favorite = true
                favoriteHeroes.append(hero)
                
            }
            completion(favoriteHeroes)
            }
            
            })
        
    }
   
    func saveObject(_ object: Heroes) {
        let tuple = (name: object.name,image: object.image,id: object.id)
        database.saveObject(tuple)
      }
    
    func removeObject(_ object:Heroes) {
        database.removeObject(object.id)
    }
}
