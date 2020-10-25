//
//  MedicineCell2.swift
//  Apteka
//
//  Created by Blurry Rabbit on 22.10.2020.
//

import UIKit

class MedicineCell: UITableViewCell {
    
    @IBOutlet weak var nameMedicine: UILabel!
    @IBOutlet weak var manufacturer: UILabel!
    @IBOutlet weak var imageMedicine: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    
    @IBAction func buyButton(_ sender: UIButton) { }
    
    static let reuseID = "DrugCell"

}
