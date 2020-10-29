//
//  Database.swift
//  Apteka
//
//  Created by Blurry Rabbit on 20.10.2020.
//

import UIKit
import SQLite

class Database {
    static let shared = Database()
    var connection: Connection?
    private let path: String
    let drugs = Table("drugs")
    
    let name            = Expression<String>("name")
    let manufacturer    = Expression<String>("manufacturer")
    let price           = Expression<String>("price")
    let image           = Expression<String>("image")
    var isFavorite      = Expression<Bool>("isFavorite")
    
    private init() {
        do {
            path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            print(path)
            connection = try Connection("\(path)/drugs.db")
        } catch {
            connection = nil
            // Error handling
        }
    }
    
    func getAllFromTable() -> [Medicine] {
        var arrayOfDrugs = [Medicine]()
        do {
            for medicine in try connection!.prepare(drugs) {
                var meds: Medicine  = Medicine()
                meds.name           = medicine[name]
                meds.manufacturer   = medicine[manufacturer]
                meds.price          = medicine[price]
                meds.image          = medicine[image]
                meds.isFavorite     = medicine[isFavorite]
                
                arrayOfDrugs.append(meds)
            }
        } catch {
            print("Database is empty. You need to put file database.db in to directory \(path)")
        }
        return arrayOfDrugs
    }
    
    
    func filterFavorites() -> [Medicine] {
        let listOfFavorites = drugs.filter(self.isFavorite == true)
        var arrayOfDrugs = [Medicine]()
        
        for medicine in try! connection!.prepare(listOfFavorites) {
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
    
    
    func favoritesIsToggled(name: String, isFavorite: Bool) {
        let drug = drugs.filter((self.name == name))
        
        if isFavorite == false {
            try! connection!.run(drug.update(self.isFavorite <- true))
        }
        else if isFavorite == true {
            try! connection!.run(drug.update(self.isFavorite <- false))
        }
    }
}
