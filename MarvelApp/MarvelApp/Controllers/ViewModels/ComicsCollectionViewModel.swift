//
//  ComicsCollectionViewModel.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 22/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import Foundation

class ComicsCollectionViewModel {
    
    var series: [String] = []
    var comics: [String] = []
    let comicsReusableIdentifier = "ComicsReusableCell"
    let seriesReusableIdentifier = "SeriesReusableCell"
    var isSeries: Bool {
        return series.count != 0 && comics.count == 0
    }
}
