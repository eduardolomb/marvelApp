//
//  FavoritesCollectionViewModel.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 24/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class FavoritesCollectionViewModel {
    weak var delegate: UICollectionViewReloader?
    var favoriteHeroes:[Heroes] = []
    func retrieveData() {
        let requestController = RequestController()
        requestController.getDataFromCoreData(completion: { [weak self] result in
            self?.favoriteHeroes = result
            self?.delegate?.reload()
            
        })
        
    }
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Favorites")
//        do {
//            if let result = try? managedContext.fetch(fetchRequest) {
//                for data in result as? [NSManagedObject] ?? [] {
//                  if let name = data.value(forKey: "name") as? String,
//                     let image = data.value(forKey: "image")as? String,
//                     let id = data.value(forKey: "id") as? Int64 {
//                    let heroe = Heroes(id: Int(id), name: name, image: image, favorite: true)
//                    favoriteHeroes.append(heroe)
//                    }
//                }
//                self.delegate?.reload()
//            }
//        }
//        
//    }
}
