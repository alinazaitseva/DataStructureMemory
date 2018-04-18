//
//  DetailViewController.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/16/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
   @IBOutlet weak var descriptionValue: UILabel!
    
    public var titleStructure: String?
    public var detailDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleStructure ?? "There is no such title"
        self.descriptionValue.text = detailDescription ?? "There is no such description"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
