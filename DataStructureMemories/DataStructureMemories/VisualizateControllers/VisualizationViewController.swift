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
            simulateData = simulateManipulations as! SimulateControllerProtocol
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let simulateData = simulateData else { return }
        
        adaptation.placeButtonsMenu(manager: controlManager!, view: stackView)
    
    }

  
}


//class VisualizationController: UIViewController {
//
//    @IBOutlet weak var viewMenu: UIStackView!
//    var fakeData: FakeDataProtocol?
//    var controlManager: ControlManagerProtocol!
//    let adapter: AdapterProtocol = Adapter()
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toTable"
//        {
//            if let controller = segue.destination as? FakeDataController {
//                fakeData = controller
//            }
//        }
//    }
//
//    override func viewDidLoad() {
//        guard let fakeData = fakeData else { return }
//
//        //        controlManager.setDelegate(delegeteFakeData: fakeData)
//        controlManager.delegeteFakeData = fakeData
//        adapter.createMenu(manager: controlManager, view: viewMenu)
//    }
//
//}

