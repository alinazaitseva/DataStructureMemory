//
//  WKWebViewController.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/23/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    var webView: WKWebView!
    var exactURL: String?

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: exactURL!)!))
        webView.allowsBackForwardNavigationGestures = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
