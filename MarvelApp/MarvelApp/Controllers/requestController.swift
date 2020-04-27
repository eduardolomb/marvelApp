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
                self?.createCharacters(hero: hero, array: &trueHeroes)
            }
        completion(trueHeroes)
        }
            
        }
    
    func createCharacters(hero: Results, array: inout [Heroes]) {
        if let name = hero.name,
            let image = hero.thumbnail?.path,
            let ext = hero.thumbnail?.ext,
            let description = hero.description,
            let id = hero.id,
            let comics = hero.comics?.items,
            let series = hero.series?.items {
            let hero = Heroes()
            hero.name = name
            hero.image = image + "." +  ext
            hero.id = id
            hero.favorite = false
            hero.description = description
            hero.comics = self.createComics(comics)
            hero.series = self.createSeries(series)
            array.append(hero)
        }
    }
    func requestSeries(url:String, completion:@escaping (String) -> Void) {
        let request:Request = Request()
            request.seriesUrl = url
            request.requestSeries(completionHandler: {result in
                let url = (result.data?.results?[0].thumbnail?.path ?? String()) +
                    "." + (result.data?.results?[0].thumbnail?.ext ?? String())
                completion(url)
        })
    }
    
    func createComics(_ comics:[Items]) -> [Comics] {
        var comicsArray:[Comics] = []
        for comic in comics {
            let appComic = Comics()
            appComic.name = comic.name ?? String()
            appComic.resource = comic.resourceURI ?? String()
            comicsArray.append(appComic)
        }
        return comicsArray
    }
    

    func createSeries(_ series:[Items]) -> [Series] {
        var seriesArray:[Series] = []
        for serie in series {
            let appSerie = Series()
            appSerie.name = serie.name ?? String()
            appSerie.resource = serie.resourceURI ?? String()
            seriesArray.append(appSerie)
        }
        return seriesArray
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

