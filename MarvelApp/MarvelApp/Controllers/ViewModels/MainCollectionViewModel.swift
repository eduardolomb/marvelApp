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
    weak var delegate: UICollectionViewReloader?
    let searchController = UISearchController(searchResultsController: nil)
    var filteredHeroes: [String] = []
    var heroes: [Heroes] = []
    
    func getInformation() {
        let requestController = RequestController()
        requestController.getData(completion: { result in
            self.heroes = result
            self.delegate?.reload()
        })

    }
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    
}
