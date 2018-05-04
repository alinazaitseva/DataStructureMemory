//
//  DictionaryTypeStructure.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/29/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class DictionaryTypeStructure: ControlManagerProtocol {
    
    var delegateSimulateController: SimulateControllerProtocol?
    private var value = ""
    private var key = ""
    let usingModel = SimulateModelCell()
    
    var buttonsMenu: [TypesOfButtons] {
        var buttonsArray: Array<TypesOfButtons> = []
        buttonsArray.append(TypesOfButtons.button(title: "PUSH", action: add ))
        buttonsArray.append(TypesOfButtons.button(title: "POP", action: delete ))
        buttonsArray.append(TypesOfButtons.textField(placeholder: "value", keyboardType: .numberPad, action: valueInTextField))
        buttonsArray.append(TypesOfButtons.textField(placeholder: "key", keyboardType: .numberPad, action: keyInTextField))
       return buttonsArray

    }
    
    func add() {
        guard let simulatedata = delegateSimulateController, let value = Int(value) else { return }
        let dictionaryElement = CellConditionEntity(value: value, descriptionValue: "value", extraValue: key, inputedValue: "key")
       
        if usingModel.count == 0 {
            usingModel.add(atIndex: 0, element: dictionaryElement)
            simulatedata.addAction(atIndex: 0, value: dictionaryElement.convertToString())
            return
        }
        
        guard let lastElement = usingModel.getElement(atIndex: usingModel.count - 1) else { return }
        if lastElement.extraValue <= key {
            let index = usingModel.count
            usingModel.add(atIndex: index, element: dictionaryElement)
            simulatedata.addAction(atIndex: index, value: dictionaryElement.convertToString())
            return
        }
        guard let firstElement = usingModel.getElement(atIndex: 0) else { return }
        
        if firstElement.extraValue > key {
            let index = 0
            usingModel.add(atIndex: index, element: dictionaryElement)
            simulatedata.addAction(atIndex: index, value: dictionaryElement.convertToString())
            return
        }
        for i in 1..<usingModel.count {
            guard let firstElement = usingModel.getElement(atIndex: i-1) else { return }
            guard let secondElement = usingModel.getElement(atIndex: i) else { return }
            
            if firstElement.extraValue <= key && secondElement.extraValue >= key {
                usingModel.add(atIndex: i, element: dictionaryElement)
                simulatedata.addAction(atIndex: i, value: dictionaryElement.convertToString())
                return
            }
        }
    }
    
    private func delete() {
        guard let simulatedata = delegateSimulateController else { return }
        
        for i in 0..<usingModel.count {
            guard let element = usingModel.getElement(atIndex: i) else { return }
            if element.extraValue == key {
                usingModel.delete(atIndex: i)
                simulatedata.deleteAction(atIndex: i)
                return
            }
        }
    }
    private func valueInTextField(text: String) {
        value = text
    }
    
    private func keyInTextField(text: String) {
        key = text
    }
    
    
}
