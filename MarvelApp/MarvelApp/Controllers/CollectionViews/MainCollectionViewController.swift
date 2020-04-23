//
//  MainCollectionViewController.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 21/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MainCollectionViewController: UICollectionViewController {

    let viewModel = MainCollectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        configureNavigationBar()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
    
    func configureSearchBar() {
        viewModel.searchController.searchResultsUpdater = self
        viewModel.searchController.obscuresBackgroundDuringPresentation = false
        viewModel.searchController.searchBar.placeholder = "Buscar Herois"

        navigationItem.searchController = viewModel.searchController
        navigationItem.titleView?.backgroundColor = UIColor.white
        navigationItem.titleView?.tintColor = UIColor.white
        definesPresentationContext = true
    }
    
    func configureNavigationBar() {
        let app = UINavigationBarAppearance()
        app.backgroundColor = UIColor.systemRed.withAlphaComponent(0.45)
        self.navigationController?.navigationBar.scrollEdgeAppearance = app
        navigationController?.navigationBar.backgroundColor = UIColor.systemRed

    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.isFiltering {
                return viewModel.filteredHeroes.count
              }
              return viewModel.heroes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    //        let candy: Candy
    //        if isFiltering {
    //          candy = filteredHeroes[indexPath.row]
    //        } else {
    //          candy = heroes[indexPath.row]
    //        }

    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    /*
     Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    
    func filterContentForSearchText(_ searchText: String) {
    }

}

extension MainCollectionViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    guard let searchText = searchBar.text else { return }
    filterContentForSearchText(searchText)
  }
}
