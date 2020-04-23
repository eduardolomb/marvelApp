//
//  MainCollectionViewCell.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 21/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var uiImageView: UIImageView!
    @IBOutlet weak var uiFavoriteButton: UIButton!
    @IBOutlet weak var uiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
