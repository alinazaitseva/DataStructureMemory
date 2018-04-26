//
//  VisualizationViewController.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/26/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class VisualizationViewController: UIViewController {

    public var appointColor: UIColor?
    public var targetSimulateController: SimulateTableViewController?
    public var titleVisual: String?
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var buttonToched: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = titleVisual {
            self.navigationItem.title = "\(title)"
        }
        
//        let popButton = createButton(named: "pop", in: containerUIView) {
//
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func pushButton() {
//        targetSimulateController?.colored = UIColor.green
//        targetSimulateController?.numberOfRows += 1
//        targetSimulateController?.tableView.reloadData()
//    }
//
//    func popButton() {
//        if targetSimulateController?.numberOfRows != 0 {
//            targetSimulateController?.numberOfRows -= 1
//        }
//        targetSimulateController?.tableView.reloadData()
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let targetSimulate = segue.destination as? SimulateTableViewController {
            self.targetSimulateController = targetSimulate
            targetSimulate.numberOfRows = 0
        }
    }
    
//    func actionButtonCreate(named title: String, view: UIStoryboard) -> UIButton {
//        let button = UIButton(type: UIButton.custom)
//        button.backgroundColor = UIColor.white
//        button.setTitle(title, for: .normal)
//        button.addTarget(view, action: #selector(buttonToched), for: .touchUpInside )
//        return button
//
//    }

}








