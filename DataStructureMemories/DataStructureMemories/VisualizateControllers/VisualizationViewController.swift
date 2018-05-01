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
    public var controlManager: ControlManagerProtocol?
    public var simulateData: SimulateControllerProtocol!
    let adaptation: AdaptationProtocol = AdaptationController()
    
    public var titleVisual: String?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let targetSimulatePath = segue.destination as? SimulateTableViewController {
            self.simulateManipulations = targetSimulatePath

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let simulateData = simulateData else { return }
        controlManager?.delegateSimulateController = simulateData
        adaptation.placeButtonsMenu(with: controlManager!, view: stackView)
    
    }
}
