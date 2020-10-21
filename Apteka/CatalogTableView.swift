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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        medicine = Database.shared.getAllFromTable()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    { return medicine.count }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrugsCell", for: indexPath) as! MedicineCell

        let meds                    = medicine[indexPath.row]
        cell.nameMedicine.text      = meds.name
        cell.manufacturer.text      = meds.manufacturer
        cell.priceLabel.text        = "\(meds.price)₽"
        cell.imageMedicine.image    = UIImage(named: meds.image)
        
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailMedicine" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! DetailMedicineTableView
                destinationVC.medicine = medicine[indexPath.row]
            }
        }
    }
}
