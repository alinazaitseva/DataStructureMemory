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
    private let initialIndex = 0
    
    var buttonsMenu: [TypeOfButtons] {
        var buttonsArray: Array<TypeOfButtons> = []
        buttonsArray.append(TypeOfButtons.button(title: "PUSH", action: add ))
        buttonsArray.append(TypeOfButtons.button(title: "POP", action: delete ))
        return buttonsArray
    }
    
    private func add() {
        guard let simulateData = delegateSimulateController else { return }
        
        let index = usingModel.count
        guard let queneElement = usingModel.getElement(at: index - 1) else {
            let newQuenEelement = CellConditionEntity(value: 0)
            usingModel.add(element: newQuenEelement, at: index)
            simulateData.addAction(at: index, value: newQuenEelement.convertToString())
            return
        }
        let newElement = CellConditionEntity(value: queneElement.value + 1)
        usingModel.add(element: newElement, at: index)
        simulateData.addAction(at: index, value: newElement.convertToString())
    }
    
    private func delete() {
        guard let simulateData = delegateSimulateController else { return }
        usingModel.deleteElement(at: initialIndex)
        simulateData.deleteAction(at : initialIndex)
    }
    
}
