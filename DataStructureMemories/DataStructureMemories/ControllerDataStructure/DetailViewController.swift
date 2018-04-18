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
    
    public var myTitle: String?
    public var detailDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = myTitle ?? ""
        self.descriptionValue.text = detailDescription ?? ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
