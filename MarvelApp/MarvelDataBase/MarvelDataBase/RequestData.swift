//
//  RequestData.swift
//  MarvelDataBase
//
//  Created by Eduardo Lombardi on 25/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import Foundation
import CoreData

public class RequestData {
    
    public init() { }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MarvelApp")
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Error ocurred, printing to log online tool \(error), \(error.userInfo)")
                #if DEBUG
                fatalError("Unresolved error \(error), \(error.userInfo)")
                #endif
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
   public func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Error ocurred, printing to log online tool \(nserror), \(nserror.userInfo)")
                #if DEBUG
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                #endif
            }
        }
    }

    
  public func getDataFromCoreData(completion: ([NSManagedObject]) -> Void) {
          let managedContext = persistentContainer.viewContext
          let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Favorites")
          do {
              if let result = try? managedContext.fetch(fetchRequest) {
                completion(result as? [NSManagedObject] ?? [])
                
              }
          }
          
      }
     
    public func saveObject(_ object: (name:String, image:String, id:Int)) {
                             let context = persistentContainer.viewContext
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
      
    public func removeObject(_ object: Int) {
              let context = persistentContainer.viewContext
              let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Favorites")
          fetchRequest.predicate = NSPredicate.init(format: "id==\(Int64(object))")
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
