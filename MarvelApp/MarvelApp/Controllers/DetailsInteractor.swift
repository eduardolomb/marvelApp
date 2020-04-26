//
//  DetailsInteractor.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 26/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import Foundation

class DetailsInteractor {
    let requestController = RequestController()
    
    func saveObject(object: Heroes) {
        requestController.saveObject(object)
    }
    
    func deleteObject(object: Heroes) {
        requestController.removeObject(object)
    }
}
