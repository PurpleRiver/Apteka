//
//  CatalogTableView.swift
//  Apteka
//
//  Created by Blurry Rabbit on 18.10.2020.
//

import UIKit

class CatalogTableView: UITableViewController {
    
    var medicine: Medicine = Medicine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        { return drugs.count }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrugsCell", for: indexPath) as! MedicineCell
        
        let medicine                = drugs[indexPath.row]
        cell.nameMedicine.text      = medicine.name
        cell.manufacturer.text      = medicine.producer
        cell.priceLabel.text        = medicine.price
        cell.imageMedicine.image    = UIImage(named: medicine.image)

        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        medicine = drugs[indexPath.row].self
        print("did select row \(medicine)")
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailMedicine" {
            guard let destinationVC = segue.destination as? DetailMedicineTableView else { return }
            
            destinationVC.medicine = medicine
            print("segue \(medicine)")
        }
    }
}
