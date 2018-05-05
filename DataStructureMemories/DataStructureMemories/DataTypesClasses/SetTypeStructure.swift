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
   
    var buttonsMenu: [TypeOfButtons] {
        var buttonsArray: Array<TypeOfButtons> = []
        buttonsArray.append(TypeOfButtons.button(title: "PUSH", action: add ))
        buttonsArray.append(TypeOfButtons.button(title: "POP", action: delete ))
        buttonsArray.append(TypeOfButtons.textField(placeholder: "value", keyboardType: .numberPad, action: valueInTextField))
        return buttonsArray
    }
    
    private func add() {
        guard let simulateData = delegateSimulateController, let value = Int(valueInTextField) else { return }
        for index in 0..<usingModel.count {
            if usingModel.getElement(at: index)?.value == value {
                return
            }
        }
        let index = usingModel.count
        let setElement = CellConditionEntity(value: value)
        usingModel.add(element: setElement, at: index)
        simulateData.addAction(at: index, value: setElement.convertToString())
    }
    
    private func delete() {
        guard let simulateData = delegateSimulateController, let value = Int(valueInTextField) else { return }
        for index in 0..<usingModel.count {
            if usingModel.getElement(at: index)?.value == value {
                usingModel.deleteElement(at: index)
                simulateData.deleteAction(at : index)
            }
        }
    }
    private func valueInTextField(text: String) {
        valueInTextField = text
    }
}
