//
//  Medicine.swift
//  Apteka
//
//  Created by Blurry Rabbit on 18.10.2020.
//

import Foundation

struct Medicine {
    var name: String
    let manufacturer: String
    let image: String
    let price: String
    var isFavorite: Bool = false
    
    
    init(name: String, manufacturer: String, image: String, price: String, isFavorite: Bool) {
        self.name           = name
        self.manufacturer   = manufacturer
        self.image          = image
        self.price          = price
        self.isFavorite     = isFavorite
    }
    
    
    init() {
        self.init(name: "", manufacturer: "", image: "Vitamin B12", price: "", isFavorite: false)
    }
}
