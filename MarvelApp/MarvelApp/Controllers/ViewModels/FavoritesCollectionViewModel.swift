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

}
