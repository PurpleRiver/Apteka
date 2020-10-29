//
//  FavoritesListVC.swift
//  Apteka
//
//  Created by Blurry Rabbit on 22.10.2020.
//

import UIKit

class FavoritesListVC: UITableViewController {
    
    var medicine: [Medicine] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "MedicineCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: MedicineCell.reuseID)
        
        medicine = Database.shared.filterFavorites()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicine.count
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MedicineCell.reuseID, for: indexPath) as! MedicineCell
        
        let meds                        = medicine[indexPath.row]
        cell.nameMedicine.text          = meds.name
        cell.manufacturer.text          = meds.manufacturer
        
        cell.priceLabel.text            = "\(meds.price)₽"
        cell.imageMedicine.image        = UIImage(named: meds.image)
        cell.favoriteImage.tintColor    = meds.isFavorite ? .systemRed : .lightGray
        
        return cell
    }
}
