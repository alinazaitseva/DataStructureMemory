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
    
    var buttonsMenu: [TypeOfButtons] {
        var buttonsArray: Array<TypeOfButtons> = []
        buttonsArray.append(TypeOfButtons.button(title: "PUSH", action: add ))
        buttonsArray.append(TypeOfButtons.button(title: "POP", action: delete ))
        buttonsArray.append(TypeOfButtons.textField(placeholder: "value", keyboardType: .numberPad, action: valueInTextField))
        buttonsArray.append(TypeOfButtons.textField(placeholder: "key", keyboardType: .numberPad, action: keyInTextField))
       return buttonsArray
    }
    
    func add() {
        guard let simulatedata = delegateSimulateController, let value = Int(value) else { return }
        let dictionaryElement = CellConditionEntity(value: value, descriptionValue: "value", extraValue: key, inputedValue: "key")
       
        if usingModel.count == 0 {
            usingModel.add(element: dictionaryElement, at: 0)
            simulatedata.addAction(at: 0, value: dictionaryElement.convertToString())
            return
        }
        
        guard let lastElement = usingModel.getElement(at: usingModel.count - 1) else { return }
        if lastElement.extraValue <= key {
            let index = usingModel.count
            usingModel.add(element: dictionaryElement, at: index)
            simulatedata.addAction(at: index, value: dictionaryElement.convertToString())
            return
        }
        guard let firstElement = usingModel.getElement(at: 0) else { return }
        
        if firstElement.extraValue > key {
            let index = 0
            usingModel.add(element: dictionaryElement, at: index)
            simulatedata.addAction(at: index, value: dictionaryElement.convertToString())
            return
        }
        for index in 1..<usingModel.count {
            guard let firstElement = usingModel.getElement(at: index-1) else { return }
            guard let secondElement = usingModel.getElement(at: index) else { return }
            
            if firstElement.extraValue <= key && secondElement.extraValue >= key {
                usingModel.add(element: dictionaryElement, at: index)
                simulatedata.addAction(at: index, value: dictionaryElement.convertToString())
                return
            }
        }
    }
    
    private func delete() {
        guard let simulatedata = delegateSimulateController else { return }
        
        for index in 0..<usingModel.count {
            guard let element = usingModel.getElement(at: index) else { return }
            if element.extraValue == key {
                usingModel.deleteElement(at: index)
                simulatedata.deleteAction(at : index)
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
