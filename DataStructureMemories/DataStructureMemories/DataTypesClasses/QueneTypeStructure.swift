//
//  QueneTypeStructure.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/29/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class QueneTypeStructure: ControlManagerProtocol {
    
    weak var delegateSimulateController: SimulateControllerProtocol?
    let usingModel = SimulateModelCell()
    
    var buttonsMenu: [TypesOfButtons] {
        var buttonsArray: Array<TypesOfButtons> = []
        buttonsArray.append(TypesOfButtons.button(title: "PUSH", action: add ))
        buttonsArray.append(TypesOfButtons.button(title: "POP", action: delete ))
        return buttonsArray
    }
    
    private func add() {
        guard let simulateData = delegateSimulateController else { return }
        
        let index = usingModel.count
        guard let queneElement = usingModel.getElement(atIndex: index - 1) else {
            let newQuenEelement = CellConditionEntity(value: 0)
            usingModel.add(atIndex: index, element: newQuenEelement)
            simulateData.addAction(atIndex: index, value: newQuenEelement.convertToString())
            return
        }
        let newElement = CellConditionEntity(value: queneElement.value + 1)
        usingModel.add(atIndex: index, element: newElement)
        simulateData.addAction(atIndex: index, value: newElement.convertToString())
    }
    
    private func delete() {
        guard let simulateData = delegateSimulateController else { return }
        usingModel.delete(atIndex: 0)
        simulateData.deleteAction(atIndex: 0)
    }
    
}
