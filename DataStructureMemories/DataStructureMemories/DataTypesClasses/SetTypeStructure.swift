//
//  SetTypeStructure.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/29/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class SetTypeStructure: ControlManagerProtocol {
    
    weak var delegateSimulateController: SimulateControllerProtocol?
    let usingModel = SimulateModelCell()
    var valueInTextField = ""
   
    var buttonsMenu: [TypesOfButtons] {
        var buttonsArray: Array<TypesOfButtons> = []
        buttonsArray.append(TypesOfButtons.button(title: "PUSH", action: add ))
        buttonsArray.append(TypesOfButtons.button(title: "POP", action: delete ))
        buttonsArray.append(TypesOfButtons.textField(placeholder: "value", keyboardType: .numberPad, action: valueInTextField))
        return buttonsArray
    }
    
    private func add() {
        guard let simulateData = delegateSimulateController, let value = Int(valueInTextField) else { return }
        for index in 0..<usingModel.count {
            if usingModel.getElement(atIndex: index)?.value == value {
                return
            }
        }
        let index = usingModel.count
        let setElement = CellConditionEntity(value: value)
        usingModel.add(atIndex: index, element: setElement)
        simulateData.addAction(atIndex: index, value: setElement.convertToString())
    }
    
    private func delete() {
        guard let simulateData = delegateSimulateController, let value = Int(valueInTextField) else { return }
        for index in 0..<usingModel.count {
            if usingModel.getElement(atIndex: index)?.value == value {
                usingModel.delete(atIndex: index)
                simulateData.deleteAction(atIndex: index)
            }
        }
    }
    private func valueInTextField(text: String) {
        valueInTextField = text
    }
}
