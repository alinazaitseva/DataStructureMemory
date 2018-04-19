//
//  ViewController.swift
//  NewProject
//
//  Created by Alina Zaitseva on 4/18/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.detailTextLabel?.text = "fsdfsdf\(indexPath.row)"
        cell.contentView.backgroundColor = UIColor.red
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier:  "DetailViewController")
        
        self.navigationController?.pushViewController(detailViewController, animated: false)
        
    }


}

