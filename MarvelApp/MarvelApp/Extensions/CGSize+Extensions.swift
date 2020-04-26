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
}
