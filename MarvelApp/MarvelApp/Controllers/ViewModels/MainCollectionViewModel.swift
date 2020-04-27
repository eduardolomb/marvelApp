//
//  MainCollectionViewModel.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 22/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import Foundation
import UIKit

protocol UICollectionViewReloader: AnyObject {
    func reload()
}

class MainCollectionViewModel {
    
    let interactor = HomeInteractor()
    weak var delegate: UICollectionViewReloader?
    let searchController = UISearchController(searchResultsController: nil)
    var filteredHeroes: [String] = []
    var heroes:[Heroes] = []
    
    func getInformation() {
        interactor.getDataFromNetwork(completion: { [weak self] result in
            self?.heroes.append(contentsOf: result)
            self?.delegate?.reload()
        })
    }
    
    func saveFavorite(object:Heroes, shouldSave: Bool) {
        interactor.saveObject(object:object, shouldSave: shouldSave)
    }
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    
}
