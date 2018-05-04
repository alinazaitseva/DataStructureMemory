//
//  DequeneTypeStructure.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/29/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class DequeueTypestructure: ControlManagerProtocol {
    
    weak var delegateSimulateController: SimulateControllerProtocol?
    let usingModel = SimulateModelCell()
    var buttonsMenu: [TypesOfButtons] {
        var buttonsArray: Array<TypesOfButtons> = []
        buttonsArray.append(TypesOfButtons.button(title: "addToEnd", action: addToEnd ))
        buttonsArray.append(TypesOfButtons.button(title: "deleteFirst", action: deleteFirst ))
        buttonsArray.append(TypesOfButtons.button(title: "deleteLast", action: deleteLast))
        buttonsArray.append(TypesOfButtons.button(title: "addToHead", action: addToHead))
        return buttonsArray
    }
    
    private func addToEnd() {
        guard let simulateData = delegateSimulateController else { return }
        let index = usingModel.count
        
        guard let dequeueElement = usingModel.getElement(atIndex: index-1) else {
            let newElement = CellConditionEntity(value: 0)
            usingModel.add(atIndex: index, element: newElement)
            simulateData.addAction(atIndex: index, value: newElement.convertToString())
            return
        }
        let newDequeueElement = CellConditionEntity(value: dequeueElement.value+1 )
        usingModel.add(atIndex: index, element: newDequeueElement)
        simulateData.addAction(atIndex: index, value: newDequeueElement.convertToString())
    }
    
    private func addToHead() {
        guard let simulateData = delegateSimulateController else { return }
        let index = 0
        
        guard let element = usingModel.getElement(atIndex: 0) else {
            let newElement = CellConditionEntity (value: 0)
            usingModel.add(atIndex: index, element: newElement)
            simulateData.addAction(atIndex: 0, value: newElement.convertToString())
            return
        }
        let newElement = CellConditionEntity(value: element.value+1)
        usingModel.add(atIndex: index, element: newElement)
        simulateData.addAction(atIndex: index, value: newElement.convertToString())
    }
    
    private func deleteFirst() {
        guard let simulateData = delegateSimulateController else { return }
        usingModel.delete(atIndex: 0)
        simulateData.deleteAction(atIndex: 0)
    }
    
    private func deleteLast() {
        guard let simulateData = delegateSimulateController else { return }
        let index = usingModel.count - 1
        usingModel.delete(atIndex: index)
        simulateData.deleteAction(atIndex: index)
    }
    
}


