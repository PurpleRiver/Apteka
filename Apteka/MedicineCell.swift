//
//  MedicineCell.swift
//  Apteka
//
//  Created by Blurry Rabbit on 18.10.2020.
//

import UIKit

class MedicineCell: UITableViewCell {

    @IBOutlet weak var nameMedicine: UILabel!
    @IBOutlet weak var manufacturer: UILabel!
    @IBOutlet weak var imageMedicine: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBAction func buyButton(_ sender: UIButton) {
        
    }
    @IBAction func favoriteButtonIsPresed(_ sender: UIButton) {
        
    }
}
