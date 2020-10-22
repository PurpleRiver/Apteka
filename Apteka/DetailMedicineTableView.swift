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
        
        Database.shared.favoritesIsToggled(name: medicine.name, isFavorite: medicine.isFavorite)
        updateMedicine()
        favoriteButton.tintColor = medicine.isFavorite ? .systemRed : .lightGray
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
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.imageMedicine.image        = UIImage(named: self.medicine.image)
            self.nameLabel.text             = self.medicine.name
            self.priceLabel.text            = "\(self.medicine.price)₽"
            self.manufacturerLabel.text     = self.medicine.manufacturer
            self.title                      = self.medicine.name
            self.favoriteButton.tintColor   = self.medicine.isFavorite ? .systemRed : .lightGray
        }
    }
    
    
    func updateMedicine() {
        medicine.isFavorite.toggle()
    }
}
