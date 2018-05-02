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
    
    public var simulateData: SimulateControllerProtocol?
    public var controlManager: ControlManagerProtocol!
    let adapter: AdaptationProtocol = AdaptationController()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            if segue.identifier == "showSimulate", let simulateDataController = segue.destination as? SimulateTableViewController {
                simulateData = simulateDataController
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let simulateData = simulateData else { return }
        controlManager.delegateSimulateController = simulateData
        adapter.createButtonsMenu(with: controlManager, view: stackView)
    
    }
}
