//
//  DataStructureTableViewController.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/12/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class DataStructureTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let dataStructureManipulatios = DataCaptureMemoryStructModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return dataStructureManipulatios.getAmountOfValuesInDataSorce()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DataStructureCell", for: indexPath) as? DataStructureCell {
        
            cell.titleLabel.text = dataStructureManipulatios.getValueInDataSource(item: indexPath.row)
        
            return cell
            
        } else {
            return tableView.dequeueReusableCell(withIdentifier: "DataStructureCell", for: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
}
