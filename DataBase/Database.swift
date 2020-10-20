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
    public var connection: Connection?
    
    public let drugs = Table("drugs")
    
    let name = Expression<String>("name")
    
    private init() {
        do {
            guard let dbPath = Bundle.main.path(forResource: "drugs", ofType: "db") else { return }
            connection = try Connection(dbPath, readonly: true)
        } catch {
            connection = nil
        }
    }
    
    func getAllFromTable() -> [Medicine] {
        var arrayOfDrugs = [Medicine]()
        for medicine in try! connection!.prepare(drugs) {
            var meds: Medicine = Medicine()
            meds.name = medicine[name]
            arrayOfDrugs.append(meds)
        }
        return arrayOfDrugs
    }
}
