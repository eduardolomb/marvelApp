//
//  CGSize+Extensions.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 26/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import Foundation
import UIKit

extension CGSize {
    
    func getMainCellWidth() -> CGSize {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        return CGSize(width: screenWidth / 2.1, height: 230)
    }
    
    func getSeriesCellWidth(count: CGFloat) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        if (screenWidth / count < 100) {
            return CGSize(width: 120, height: 230)
        }
        return CGSize(width: screenWidth / count, height: 230)
    }
}
