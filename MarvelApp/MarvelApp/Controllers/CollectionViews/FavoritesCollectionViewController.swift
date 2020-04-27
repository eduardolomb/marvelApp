//
//  ComicsCollectionViewController.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 21/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class FavoritesCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let viewModel = FavoritesCollectionViewModel()
    @IBOutlet var uiCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        // Register cell classes
        viewModel.delegate = self
        self.uiCollectionView.delegate = self
        self.uiCollectionView.dataSource = self
        self.uiCollectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel.retrieveData()
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
        return viewModel.favoriteHeroes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        cell.text = viewModel.favoriteHeroes[indexPath.row].name
        if let url = URL(string: viewModel.favoriteHeroes[indexPath.row].image) {
            cell.image = url
            cell.favorited = true
        }

        return cell
    }
    
    func collectionView(_ colectionView:UICollectionView,
     didSelectItemAt indexPath:IndexPath) {
     let object = viewModel.favoriteHeroes[indexPath.row]
         let newController = self.storyboard?.instantiateViewController(identifier: Constants.detailsViewController) as? DetailsViewController
         let viewModel = DetailsViewModel()
         viewModel.heroe = object
         viewModel.comics = object.comics
         viewModel.series = object.series
         newController?.viewModel = viewModel
         
         if let controller = newController { self.navigationController?.pushViewController(controller, animated: true)
         }


     }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

}

extension FavoritesCollectionViewController: UICollectionViewReloader {
    func reload() {
        DispatchQueue.main.async {
            self.uiCollectionView.reloadData()
        }
    }

}

extension FavoritesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize().getMainCellWidth()
    }
}
