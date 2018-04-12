//
//  DataStructureTableViewController.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/12/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class DataStructureTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var memoryList = ["Stack","Queue","Set","Dequeue","Priority Queue","List(Array)", "MultiSet","Dictionary"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoryList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataStructureCell", for: indexPath) as! DataStructureCell
        
        cell.titleLabel.text = memoryList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
}
