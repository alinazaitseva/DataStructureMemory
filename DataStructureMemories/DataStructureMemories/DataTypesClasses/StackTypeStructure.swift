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
    
    var buttonsMenu: [TypesOfButtons] {
        var buttonsArray: Array<TypesOfButtons> = []
        buttonsArray.append(TypesOfButtons.button(title: "PUSH", action: add ))
        buttonsArray.append(TypesOfButtons.button(title: "POP", action: delete ))
        return buttonsArray
    }
    
    weak var delegateSimulateData: SimulateControllerProtocol?
    let usingModel = SimulateModelCell()
    
    private func add() {
        guard let simulateData = delegateSimulateData else { return }
        
        let index = 0
        
        guard let elementInStack = usingModel.getElement(atIndex: index) else {
            let newElementInStack = CellConditionEntity(value: 0)
            usingModel.add(atIndex: index, element: newElementInStack)
            simulateData.addAction(atIndex: index, value: newElementInStack.convertToString())
            return
        }
       let newElement = CellConditionEntity(value: elementInStack.value+1)
        usingModel.add(atIndex: index, element: newElement)
        simulateData.addAction(atIndex: index, value: newElement.convertToString())
    }
    
    private func delete() {
        guard let simulateData = delegateSimulateData else { return }
        usingModel.delete(atIndex: 0)
        simulateData.deleteAction(atIndex: 0)
    }
    
}

