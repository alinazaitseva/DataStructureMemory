//
//  List(Array)TypeStructure.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/29/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class ListTypeStructure: ControlManagerProtocol {
    
    weak var delegateSimulateController: SimulateControllerProtocol?
    private var valueInTextField = ""
    let usingModel = SimulateModelCell()
    
    var buttonsMenu: [TypesOfButtons] {
        var buttonsArray: Array<TypesOfButtons> = []
        buttonsArray.append(TypesOfButtons.button(title: "PUSH", action: add ))
        buttonsArray.append(TypesOfButtons.button(title: "POP", action: delete ))
        buttonsArray.append(TypesOfButtons.textField(placeholder: "index", keyboardType: .numberPad, action: valueInTextField))
        return buttonsArray
    }
    
    private func add() {
        guard let simulateData = delegateSimulateController, let index = Int(valueInTextField)
            else { return }
        if index >= 0 && index <= usingModel.count {
            let listElement = CellConditionEntity(value: usingModel.count)
            usingModel.add(atIndex: index, element: listElement)
            simulateData.addAction(atIndex: index, value: listElement.convertToString())
        }
    }
    
    private func delete() {
        guard let simulateData = delegateSimulateController, let index = Int(valueInTextField)
            else { return }
        if index >= 0 && index <= usingModel.count {
            usingModel.delete(atIndex: index)
            simulateData.deleteAction(atIndex: index)
        }
    }
    
    private func valueInTextField(text: String) {
        valueInTextField = text
    }

}
