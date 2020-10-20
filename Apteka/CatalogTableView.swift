//
//  CatalogTableView.swift
//  Apteka
//
//  Created by Blurry Rabbit on 18.10.2020.
//

import UIKit
import SQLite

class CatalogTableView: UITableViewController {
    
    var medicine: [Medicine] = []
    
    let database = Database.shared.connection
    let meds = Database.shared.drugs
    let name = Expression<String>("name")
    let manufacturer = Expression<String>("manufacturer")
    let price = Expression<String>("price")
    let image = Expression<String>("image")

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        medicine = Database.shared.getAllFromTable()
        print(medicine)
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    { return medicine.count }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrugsCell", for: indexPath) as! MedicineCell
        
//        for medicine in try! Database.shared.connection!.prepare(meds)
//
//
        let med = medicine[indexPath.row]
        cell.nameMedicine.text      = med.name
        cell.manufacturer.text      = med.manufacturer
        cell.priceLabel.text        = med.price
        cell.imageMedicine.image    = UIImage(named: med.image)
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        medicine = drugs[indexPath.row].self
        print("did select row \(medicine)")
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailMedicine" {
            guard let destinationVC = segue.destination as? DetailMedicineTableView else { return }
            
//            destinationVC.medicine = medicine
            print("segue \(medicine)")
        }
    }
}
