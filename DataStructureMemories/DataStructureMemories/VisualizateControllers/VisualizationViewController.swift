//
//  VisualizationViewController.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/26/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class VisualizationViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    public var simulateManipulations: SimulateTableViewController?
    public var controlManager: ATDControlProtocol?
    public let controllerAdapter: AdaptationProtocol? = nil
    public var titleVisual: String?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = titleVisual {
            self.navigationItem.title = "\(title)"
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let targetSimulate = segue.destination as? SimulateTableViewController {
            self.simulateManipulations = targetSimulate
            targetSimulate.numberOfRows = 0
        }
    }
}
