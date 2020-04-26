//
//  DetailsViewController.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 22/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {

    var viewModel = DetailsViewModel()
    let comicSeriesViewModel = ComicsCollectionViewModel()
    
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
        configureImage()
        configureTexts()
        self.title = viewModel.heroe.name
       // self.uiImageView.image = 
        // Do any additional setup after loading the view.
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
