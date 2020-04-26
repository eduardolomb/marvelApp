//
//  DetailsViewController.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 22/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import UIKit
import Kingfisher

enum StarImage: String {
    case notfavorited = "star"
    case favorited = "star.fill"
}

class DetailsViewController: UIViewController {

    var viewModel = DetailsViewModel()
    let comicSeriesViewModel = ComicsCollectionViewModel()
    var imageName = ""
    var buttonItem = UIBarButtonItem()
    var isFavorited: Bool = false {
        didSet {
            imageName = self.isFavorited ? StarImage.favorited.rawValue : StarImage.notfavorited.rawValue
            buttonItem.image = UIImage(systemName: imageName)
        }
    }

    @IBOutlet weak var uiDescription: UILabel!
    @IBOutlet weak var uiImageView: UIImageView!
    @IBOutlet weak var comicsCollectionView: UICollectionView!
    
    @IBOutlet weak var seriesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        comicsCollectionView.delegate = self
        comicsCollectionView.dataSource = self
        seriesCollectionView.delegate = self
        seriesCollectionView.dataSource = self
        configureNavBar()
        configureImage()
        configureTexts()
        configureCollectionViewModels()
        self.title = viewModel.heroe.name
        // Do any additional setup after loading the view.
    }
    
    
    func configureNavBar() {
        self.buttonItem = UIBarButtonItem(image: UIImage(systemName: "star"), style:.plain, target: self, action: #selector(favTapped))
        self.isFavorited = viewModel.heroe.favorite
        navigationItem.rightBarButtonItem = buttonItem
    }
    
    @objc func favTapped() {
        if self.isFavorited {
            viewModel.deleteObject()
            self.isFavorited = !self.isFavorited
            return
        }
        self.isFavorited = !self.isFavorited
        viewModel.saveObject()
    }
    
    func configureTexts() {
        uiDescription.text = viewModel.heroe.description
    }
    func configureImage() {
        let url = URL(string: viewModel.heroe.image)
        let processor = DownsamplingImageProcessor(size: uiImageView.bounds.size)
        uiImageView.kf.indicatorType = .activity
        uiImageView.kf.setImage(with: url, options: [KingfisherOptionsInfoItem.processor(processor)])
    }
    func configureCollectionViewModels() {
        self.comicSeriesViewModel.comics = self.viewModel.comics
        self.comicSeriesViewModel.series = self.viewModel.series
    }

}

extension DetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == seriesCollectionView {
                return comicSeriesViewModel.series.count
        }
        return comicSeriesViewModel.comics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == seriesCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: comicSeriesViewModel.seriesReusableIdentifier, for: indexPath) as? Comics_SeriesCollectionViewCell {
//            cell?.uiImageView.image = comicSeriesViewModel.series[indexPath.row]
//            cell?.description = comicSeriesViewModel.series[indexPath.row]
            return cell
            }
        }
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: comicSeriesViewModel.comicsReusableIdentifier, for: indexPath) as? Comics_SeriesCollectionViewCell {
//           cell?.uiImageView.image = comicSeriesViewModel.comics[indexPath.row
//            cell?.description = comicSeriesViewModel.comics[indexPath.row]
            return cell
            }
        return UICollectionViewCell()
    }
    
    
}
