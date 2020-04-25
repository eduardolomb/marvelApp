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

class RequestController {
        
    var offset = 0
    
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
                    let id = hero.id {
                    trueHeroes.append(Heroes(id: id, name: name, image: image + "." + ext, favorite: false))
                }
            }
            completion(trueHeroes)
        }
    }
    
    
    func getDataFromCoreData(completion: ([Heroes]) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        var favoriteHeroes:[Heroes] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Favorites")
        do {
            if let result = try? managedContext.fetch(fetchRequest) {
                for data in result as? [NSManagedObject] ?? [] {
                  if let name = data.value(forKey: "name") as? String,
                     let image = data.value(forKey: "image")as? String,
                     let id = data.value(forKey: "id") as? Int64 {
                    let heroe = Heroes(id: Int(id), name: name, image: image, favorite: true)
                    favoriteHeroes.append(heroe)
                    }
                }
                completion(favoriteHeroes)
            }
        }
        
    }
   
    func saveObject(_ object: Heroes) {
                           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                               return
                           }
                           
                           let context = appDelegate.persistentContainer.viewContext
                           guard let favorite = NSEntityDescription.insertNewObject(forEntityName: "Favorites", into: context) as? Favorites else {
                                 return
                           }
                           favorite.image = object.image
                           favorite.name = object.name
                           favorite.id = Int64(object.id)
                           
                           do {
                               try context.save()
                           } catch {
                               print("Could not save. \(error), \(error.localizedDescription)")
                           }
      }
    
    func removeObject(_ object:Heroes) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Favorites")
        fetchRequest.predicate = NSPredicate.init(format: "id==\(Int64(object.id))")
        if let objects = try? context.fetch(fetchRequest),
            let favorites = objects as? [Favorites] {
            for fav in favorites {
                context.delete(fav)
            }
        }
        do {
            try context.save()
        } catch {
            print("Could not save. \(error), \(error.localizedDescription)")
        }
    }
}
