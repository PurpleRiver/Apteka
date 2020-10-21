//
//  Medicine.swift
//  Apteka
//
//  Created by Blurry Rabbit on 18.10.2020.
//

import Foundation

struct Medicine {
    var name: String
    var manufacturer: String
    var image: String
    var price: String
    var isFavorite: Bool = false
    
    
    init(name: String, manufacturer: String, image: String, price: String, isFavorite: Bool) {
        self.name           = name
        self.manufacturer   = manufacturer
        self.image          = image
        self.price          = price
        self.isFavorite     = isFavorite
    }
    
    
    init() {
        self.init(name: "", manufacturer: "", image: "", price: "", isFavorite: false)
    }
}
