//
//  DetailMedicineTableView.swift
//  Apteka
//
//  Created by Blurry Rabbit on 18.10.2020.
//

import UIKit

class DetailMedicineTableView: UITableViewController {
    
    @IBOutlet weak var imageMedicine: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var manufacturerLabel: UILabel!
    
    @IBAction func favoriteButtonIsPressed(_ sender: UIButton) {
        favoriteButton.tintColor = .systemRed
    }

    @IBAction func buyButonIsPressed(_ sender: UIButton) { }
    
    var medicine = Medicine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurateUI()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        else            { return 3 }
    }

    
    func configurateUI() {
        imageMedicine.image     = UIImage(named: medicine.image)
        nameLabel.text          = medicine.name
        priceLabel.text         = "\(medicine.price)₽"
        manufacturerLabel.text  = medicine.manufacturer
        self.title              = medicine.name
    }
}
