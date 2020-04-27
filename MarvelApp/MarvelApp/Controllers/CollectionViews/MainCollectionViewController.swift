//
//  MainCollectionViewController.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 21/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import UIKit
import Kingfisher

protocol SaveFavoriteDelegate: AnyObject {
    func saveObject(_ object:Heroes, shouldSave: Bool)
}

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
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.uiCollectionView.reloadData()
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
        cell.delegate = self
        cell.text = viewModel.heroes[indexPath.row].name
        if let url = URL(string: viewModel.heroes[indexPath.row].image) {
            cell.image = url
        }
        cell.series = viewModel.heroes[indexPath.row].series
        cell.id = viewModel.heroes[indexPath.row].id
        cell.favorited = viewModel.heroes[indexPath.row].favorite
        cell.accessibilityLabel = viewModel.heroes[indexPath.row].name
        
        return cell

    }
    
    
    func collectionView(_ colectionView:UICollectionView,
    didSelectItemAt indexPath:IndexPath) {
    let object = viewModel.heroes[indexPath.row]
        let newController = self.storyboard?.instantiateViewController(identifier: Constants.detailsViewController) as? DetailsViewController
        let viewModel = DetailsViewModel()
        viewModel.heroe = object
        viewModel.comics = object.comics
        viewModel.series = object.series
        newController?.viewModel = viewModel
        
        if let controller = newController { self.navigationController?.pushViewController(controller, animated: true)
        }


    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item > viewModel.heroes.count/2 {
            viewModel.getInformation()
        }
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
             let indexPath = IndexPath(row: self.viewModel.heroes.count - 1, section: 0)
            self.uiCollectionView.performBatchUpdates({
            self.uiCollectionView.insertItems(at: [indexPath])
            }, completion: nil)

        }
    }

}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize().getMainCellWidth()
    }
}

extension MainCollectionViewController: SaveFavoriteDelegate {
    
    func saveObject(_ object: Heroes, shouldSave: Bool) {
        viewModel.saveFavorite(object: object, shouldSave: shouldSave)
    }
}

