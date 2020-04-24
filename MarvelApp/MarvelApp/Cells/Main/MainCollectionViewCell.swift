//
//  MainCollectionViewCell.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 21/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import UIKit
import CoreData

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var uiImageView: UIImageView!
    @IBOutlet weak var uiFavoriteButton: UIButton!
    @IBOutlet weak var uiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func saveFavorite() {
        let imageData = uiImageView.image?.pngData()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        guard let favorite = NSEntityDescription.insertNewObject(forEntityName: "Favorites", into: context) as? Favorites else {
              return
        }
        favorite.image = imageData
        favorite.name = uiLabel.text
        do {
            try context.save()
        } catch {
            print("Could not save. \(error), \(error.localizedDescription)")
        }
    }
    
    @IBAction func favoriteButtonAction(_ sender: Any) {
        self.saveFavorite()
    }
}
