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
    }
    @IBAction func buyButonIsPressed(_ sender: UIButton) {
    }
    var medicine = Medicine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateUI(medicine: medicine)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        else            { return 3 }
    }

    
    func configurateUI(medicine: Medicine) {
        imageMedicine.image     = #imageLiteral(resourceName: "Vitamins")
        nameLabel.text          = medicine.name
        priceLabel.text         = medicine.price
        manufacturerLabel.text  = medicine.manufacturer
    }
}
