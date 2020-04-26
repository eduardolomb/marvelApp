//
//  DetailsViewModel.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 22/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewModel {
    var heroe: Heroes = Heroes()
    var comics:[Comics] = []
    var series:[Series] = []
    
    let detailsInteractor = DetailsInteractor()
    
    func saveObject() {
        detailsInteractor.saveObject(object: heroe)
    }
    
    func deleteObject() {
        detailsInteractor.deleteObject(object: heroe)
    }
}
