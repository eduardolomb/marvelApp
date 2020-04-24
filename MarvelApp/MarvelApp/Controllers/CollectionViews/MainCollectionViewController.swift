//
//  MainCollectionViewController.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 21/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "cell"

class MainCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var uiCollectionView: UICollectionView!
    let viewModel = MainCollectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        configureNavigationBar()
        viewModel.getInformation()
        viewModel.delegate = self
        self.uiCollectionView.delegate = self
        self.uiCollectionView.dataSource = self
        self.uiCollectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

        
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

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.isFiltering {
                return viewModel.filteredHeroes.count
              }
              return viewModel.heroes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        cell.text = viewModel.heroes[indexPath.row].name
        if let url = URL(string: viewModel.heroes[indexPath.row].image) {
            cell.image = url
        }

        return cell

    }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

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

extension MainCollectionViewController: UICollectionViewReloader {
    func reload() {
        DispatchQueue.main.async {
            self.uiCollectionView.reloadData()
        }
    }

}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 230)
    }
}
