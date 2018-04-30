//
//  SimulateTableViewController.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/26/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class SimulateTableViewController: UITableViewController {

    @IBOutlet weak var simulateTableView: UITableView!
    
    public var numberOfRows = 0
    var listOfValuesInArray: [CurrentCellCondition] = []
    
    enum Condition {
        case forward
        case previous
    }
    
    class CurrentCellCondition {
        let value: String?
        let condition: Condition
        
        init(in value: String, with condition: Condition = .forward ) {
            self.condition = .forward
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SimulateVisualCell", for: indexPath) as? SimulateVisualCell
            else { return UITableViewCell() }
        cell.configureWith(data: listOfValuesInArray[indexPath.row].value! )
        if listOfValuesInArray[indexPath.row].condition == .forward {
            cell.setUpUIColor(color: .red)
        } else {
            cell.setUpUIColor(color: .clear)
        }
        return cell
    }
    
    func addAction(atIndex: Int, value: String) {
        listOfValuesInArray.insert(CurrentCellCondition(in: value), at: atIndex)
        tableView.insertRows(at: [IndexPath(row: atIndex, section: 0)], with: .bottom)
    }
    
    func deleteAction(atIndex: Int) {
        guard listOfValuesInArray.indices.contains(atIndex) else { return }
        listOfValuesInArray.remove(at: atIndex)
        tableView.deleteRows(at: [IndexPath(row: atIndex, section: 0)], with: .bottom)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
