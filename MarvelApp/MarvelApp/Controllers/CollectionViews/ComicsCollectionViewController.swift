//
//  ComicsCollectionViewController.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 21/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ComicsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
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
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

}
