//
//  StackTypeStructure.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/29/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class StackTypeStructure: ControlManagerProtocol {
    var delegateSimulateController: SimulateControllerProtocol?
    
    func createButtonsMenu() -> [TypesOfButtons] {
        <#code#>
    }
    private func addValue() {
        guard let simulateData = delegateSimulateController else { return }
        let indexOfLabel = simulateData
    }
    
}
