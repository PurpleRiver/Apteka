//
//  CatalogTableView.swift
//  Apteka
//
//  Created by Blurry Rabbit on 18.10.2020.
//

import UIKit
import SQLite

class CatalogTableView: UITableViewController {
    
    var searchController: UISearchController!
    
    var medicine: [Medicine]            = []
    var filteredMedicine: [Medicine]    = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurateSearchController()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        medicine = Database.shared.getAllFromTable()
        tableView.reloadData()
    }
    
    
    func configurateSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater   = self
        searchController.searchBar.delegate     = self
        searchController.searchBar.placeholder  = "Найти лекарство"
        tableView.tableHeaderView               = searchController.searchBar
        
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return searchController.isActive ? filteredMedicine.count : medicine.count
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MedicineCell.reuseID, for: indexPath) as! MedicineCell
        
        let meds = searchController.isActive ? filteredMedicine[indexPath.row] : medicine[indexPath.row]
        
        cell.nameMedicine.text          = meds.name
        cell.manufacturer.text          = meds.manufacturer
        
        cell.priceLabel.text            = "\(meds.price)₽"
        cell.imageMedicine.image        = UIImage(named: meds.image)
        cell.favoriteImage.tintColor    = meds.isFavorite ? .systemRed : .lightGray
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailMedicine" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! DetailMedicineTableView
                if searchController.isActive {
                    destinationVC.medicine = filteredMedicine[indexPath.row]
                } else {
                    destinationVC.medicine = medicine[indexPath.row]
                }
            }
        }
    }
}


extension CatalogTableView: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
        filteredMedicine = medicine.filter { $0.name.lowercased().contains(filter.lowercased()) }
        tableView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredMedicine            = []
        searchController.isActive   = false
        tableView.reloadData()
    }
}
