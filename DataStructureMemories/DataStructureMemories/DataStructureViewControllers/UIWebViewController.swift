//
//  UIWebViewController.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/23/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class UIWebViewController: UIViewController, UIWebViewDelegate {
    var exactURL: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        let urlRequest: URLRequest = URLRequest(url: URL(string: exactURL)!)
        UIWebView.loadRequest(urlRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBOutlet weak var UIWebView: UIWebView!
    
    @IBAction func tapedBackButton(_ sender: Any) {
            self.dismiss(animated: true)
    }    
    
}
