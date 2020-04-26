//
//  Heroes.swift
//  MarvelApp
//
//  Created by Eduardo Lombardi on 23/04/20.
//  Copyright © 2020 Eduardo Lombardi. All rights reserved.
//

import Foundation

class Heroes {
    var id: Int = 0
    var name: String = String()
    var image: String = String()
    var description: String = String()
    var favorite: Bool = false
    var comics: [Comics] = []
    var series: [Series] = []
}
