//
//  Medicine.swift
//  Apteka
//
//  Created by Blurry Rabbit on 18.10.2020.
//

import Foundation

struct Medicine {
    let name: String
    let producer: String
    let image: String
    let price: String
    var isFavorite: Bool = false
    
    init(name: String, producer: String, image: String, price: String, isFavorite: Bool) {
        self.name       = name
        self.producer   = producer
        self.image      = image
        self.price      = price
        self.isFavorite = isFavorite
    }
    
    
    init() {
        self.init(name: "Doppel Herzaktiv таблетки 60", producer: "КВАИССЕР ФАРМА", image: "Vitamins", price: "600R", isFavorite: false)
    }
}
