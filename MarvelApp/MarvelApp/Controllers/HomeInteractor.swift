//
//  HomeInteractor.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 25/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import Foundation
import UIKit

class HomeInteractor {
    
    var favoriteHeroes:[Heroes] = []
    var heroes:[Heroes] = []
    let requestController = RequestController()
    
    private func getDataFromCoreData(completion: () -> Void) {
        requestController.getDataFromCoreData(completion: { [weak self] result in
        self?.favoriteHeroes = result
        completion()
    })
        completion()
    }
    
    func getDataFromNetwork(completion: @escaping ([Heroes]) -> Void) {
        self.getDataFromCoreData(completion: {
        requestController.getDataFromNetwork(completion: { [weak self] result in
            self?.heroes.append(contentsOf: result)
            self?.compareData(completion: { result in
                completion(result)
            })
    })
        })
    }
    
    private func compareData(completion: ([Heroes]) -> Void) {
        for heroe in favoriteHeroes {
            let object = heroes.filter {$0.id == heroe.id}.first
               object?.favorite = true
        }
        completion(self.heroes)
    }
    
    func saveObject(object: Heroes, shouldSave: Bool) {
            if let index = searchObject(object) {
                self.heroes[index].favorite = shouldSave
            }
            if shouldSave {
                requestController.saveObject(object)
                return
            }
            requestController.removeObject(object)
    }
    func searchObject(_ object: Heroes) -> Int? {
            for (index, value) in self.heroes.enumerated()
               {
                if value.id == object.id {
                      return index
                   }
               }
        return nil
        }
    
}
