//
//  MedicineCell2.swift
//  Apteka
//
//  Created by Blurry Rabbit on 22.10.2020.
//

import UIKit

class MedicineCell2: UITableViewCell {
    
    @IBOutlet weak var nameMedicine: UILabel!
    @IBOutlet weak var manufacturer: UILabel!
    @IBOutlet weak var imageMedicine: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    
    
    @IBAction func buyButton(_ sender: UIButton) { }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    func commonInit(_ name: String,
                    manufacturer: String,
                    image: String,
                    price: String,
                    favoriteImage: String) {
        
        self.nameMedicine.text   = name
        self.manufacturer.text   = manufacturer
        self.imageMedicine.image = UIImage(named: image)
        self.priceLabel.text     = price
        self.favoriteImage.image = UIImage(named: favoriteImage)
    }
    
    //    let reuseID =
}
