//
//  UIWebViewController.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/23/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class UIWebViewController: UIViewController, UIWebViewDelegate {
    var exactURL: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView: UIWebView = UIWebView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        self.view.addSubview(webView)
        webView.delegate = self
        
        let urlRequest: URLRequest = URLRequest(url: URL(string: exactURL!)!)
        webView.loadRequest(urlRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    @IBAction func backButton(_ sender: Any) {
        navigationController?.dismiss(animated: true)
    }
    
}
