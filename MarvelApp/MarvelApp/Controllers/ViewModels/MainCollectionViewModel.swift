//
//  MainCollectionViewModel.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 22/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import Foundation
import UIKit

class MainCollectionViewModel {
 
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredHeroes: [String] = []
    var heroes: [String] = []
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
}
