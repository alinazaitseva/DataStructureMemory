//
//  VisualizationViewController.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/26/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class VisualizationViewController: UIViewController {

    public var manipulationsWithSimulateController: SimulateTableViewController?
    public var titleVisual: String?
    public var 
    @IBOutlet weak var stackView: UIStackView!
    
  
    @objc func buttonTouched() {
        print("1")
        print("2")
    }
    @objc func buttonPushed() {
        print("push")
    }
    
    @objc func buttonPoped() {
        print("pop")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = titleVisual {
            self.navigationItem.title = "\(title)"
        }
        let popButton = createActionButton(title: "Pop")
        stackView.addArrangedSubview(popButton)
        let pushButton = createActionButton(title: "Push")
        stackView.addArrangedSubview(pushButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let targetSimulate = segue.destination as? SimulateTableViewController {
            self.manipulationsWithSimulateController = targetSimulate
            targetSimulate.numberOfRows = 0
        }
    }
    
    func createActionButton(title: String) -> UIButton {
        let button = UIButton(frame: CGRect(x:0, y:0, width:100, height: 64))
        button.backgroundColor = UIColor.yellow
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside);
        return button
    }
}


