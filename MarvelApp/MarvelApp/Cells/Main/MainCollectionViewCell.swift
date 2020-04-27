//
//  MainCollectionViewCell.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 21/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import UIKit
import CoreData
import Kingfisher

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var uiImageView: UIImageView!
    @IBOutlet weak var uiFavoriteButton: UIButton!
    @IBOutlet weak var uiLabel: UILabel!
    weak var delegate: SaveFavoriteDelegate?
    var series:[Series] = []
    var id: Int  = 0
    var favorited: Bool = false {
        didSet {
            uiFavoriteButton.isSelected = favorited
        }
    }
    var text:String = "" {
        didSet {
            uiLabel.text = text
        }
    }
    var image:URL = URL(fileURLWithPath: "") {
        didSet {
            let processor = DownsamplingImageProcessor(size: uiImageView.bounds.size)
            uiImageView.kf.indicatorType = .activity
            uiImageView.kf.setImage(with: image, options: [KingfisherOptionsInfoItem.processor(processor)])
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       self.layer.borderWidth = 3.0
       self.layer.borderColor = UIColor.gray.cgColor
    }
    
    func saveFavorite() {
        let heroe = Heroes()
        heroe.image = self.image.absoluteString
        heroe.name = self.text
        heroe.id = self.id
//        heroe.comics =
        heroe.series = self.series
        delegate?.saveObject(heroe, shouldSave: self.favorited)
    }
    
    @IBAction func favoriteButtonAction(_ sender: Any) {
       self.favorited = !self.favorited
       self.saveFavorite()
    }
}
