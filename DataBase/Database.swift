//
//  Database.swift
//  Apteka
//
//  Created by Blurry Rabbit on 20.10.2020.
//

import Foundation
import SQLite

class Database {
    static let shared = Database()
    var connection: Connection?
    
    let drugs = Table("drugs")
    
    let name            = Expression<String>("name")
    let manufacturer    = Expression<String>("manufacturer")
    let price           = Expression<String>("price")
    let image           = Expression<String>("image")
    var isFavorite      = Expression<Bool>("isFavorite")
    
    private init() {
        do {
            let path = "/Users/idelusupov/Library/Mobile Documents/com~apple~CloudDocs/Documents/StudyProjects/Apteka/Apteka/"
            connection = try Connection("\(path)/drugs.db")
//
//            guard let dbPath = Bundle.main.path(forResource: "drugs", ofType: "db") else { return }
//            connection = try Connection(dbPath, readonly: false)
        } catch {
            connection = nil
            // Error handling
        }
    }
    
    func getAllFromTable() -> [Medicine] {
        var arrayOfDrugs = [Medicine]()
        for medicine in try! connection!.prepare(drugs) {
            var meds: Medicine  = Medicine()
            meds.name           = medicine[name]
            meds.manufacturer   = medicine[manufacturer]
            meds.price          = medicine[price]
            meds.image          = medicine[image]
            meds.isFavorite     = medicine[isFavorite]
            
            arrayOfDrugs.append(meds)
        }
        return arrayOfDrugs
    }
    
    func favoritesIsToggled() {
        
        let favorited = try! connection!.pluck(drugs)
        
        if favorited![isFavorite] == false {
            try! connection?.run(drugs.update(isFavorite <- true))
//            return true
        }
        else if favorited![isFavorite] == true {
            try! connection?.run(drugs.update(isFavorite <- false))
//            return false
        }
    }
}
