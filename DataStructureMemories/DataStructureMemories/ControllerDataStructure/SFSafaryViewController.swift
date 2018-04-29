//
//  SFSafaryViewController.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/23/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit
import SafariServices

class SFSafaryViewController: UIViewController, SFSafariViewControllerDelegate {

    var exactURL: String?
    var isClosing = false
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url = URL(string: self.exactURL!) else {
            print("Error!")
            return
        }
        
        let safaryController = SFSafariViewController(url: url, entersReaderIfAvailable: true)
        safaryController.delegate = self
        
        if isClosing {
            dismiss(animated: true)
        } else {
            self.present(safaryController, animated: true)
        }
    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        isClosing = true
    }
    
}
