//
//  Comics&SeriesCollectionViewCell.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 21/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import UIKit
import Kingfisher

class Comics_SeriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var uiImageView: UIImageView!
    @IBOutlet weak var uiLabel: UILabel!
    
    var text = String() {
        didSet {
            uiLabel.text = text
        }
    }
    var image:URL? = URL(fileURLWithPath: "") {
           didSet {
               let processor = DownsamplingImageProcessor(size: uiImageView.bounds.size)
               uiImageView.kf.indicatorType = .activity
               uiImageView.kf.setImage(with: image, options: [KingfisherOptionsInfoItem.processor(processor)])
           }
       }

}
