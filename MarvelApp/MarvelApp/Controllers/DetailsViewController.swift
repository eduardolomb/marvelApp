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
        if viewModel.heroe.description == "" {
            self.uiDescription.removeFromSuperview()
            return
        }
        uiDescription.text = viewModel.heroe.description
    }
    func configureImage() {
        let url = URL(string: viewModel.heroe.image)
        let processor = DownsamplingImageProcessor(size: uiImageView.bounds.size)
        uiImageView.kf.indicatorType = .activity
        uiImageView.kf.setImage(with: url, options: [KingfisherOptionsInfoItem.processor(processor)])
    }
    
    func configureCollectionViewModels() {
        self.comicsCollectionView.register(UINib(nibName: "Comics_SeriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: comicSeriesViewModel.seriesReusableIdentifier)
    

        self.comicSeriesViewModel.comics = self.viewModel.comics
        self.comicSeriesViewModel.series = self.viewModel.series
    }

}

extension DetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return comicSeriesViewModel.series.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: comicSeriesViewModel.seriesReusableIdentifier, for: indexPath) as? Comics_SeriesCollectionViewCell {
                let object = self.comicSeriesViewModel.series[indexPath.row]
                self.comicSeriesViewModel.getData(url: object.resource, completion: { [weak self] url in
                    DispatchQueue.main.async {
                        cell.image = URL(string:url)
                    }
                })

                cell.text = object.name
                
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

extension DetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize().getSeriesCellWidth(count:CGFloat(self.comicSeriesViewModel.series.count))
    }
}
