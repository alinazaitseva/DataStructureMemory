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
    var buttonsMenu: [TypeOfButtons] {
        var buttonsArray: Array<TypeOfButtons> = []
        buttonsArray.append(TypeOfButtons.button(title: "addToEnd", action: addToEnd ))
        buttonsArray.append(TypeOfButtons.button(title: "deleteFirst", action: deleteFirst ))
        buttonsArray.append(TypeOfButtons.button(title: "deleteLast", action: deleteLast))
        buttonsArray.append(TypeOfButtons.button(title: "addToHead", action: addToHead))
        return buttonsArray
    }
    
    private func addToEnd() {
        guard let simulateData = delegateSimulateController else { return }
        let index = usingModel.count
        
        guard let dequeueElement = usingModel.getElement(at: index-1) else {
            let newElement = CellConditionEntity(value: 0)
            usingModel.add(element: newElement, at: index)
            simulateData.addAction(at: index, value: newElement.convertToString())
            return
        }
        let newDequeueElement = CellConditionEntity(value: dequeueElement.value+1 )
        usingModel.add(element: newDequeueElement, at: index)
        simulateData.addAction(at: index, value: newDequeueElement.convertToString())
    }
    
    private func addToHead() {
        guard let simulateData = delegateSimulateController else { return }
        let index = 0
        
        guard let element = usingModel.getElement(at: 0) else {
            let newElement = CellConditionEntity (value: 0)
            usingModel.add(element: newElement, at: index)
            simulateData.addAction(at: 0, value: newElement.convertToString())
            return
        }
        let newElement = CellConditionEntity(value: element.value+1)
        usingModel.add(element: newElement, at: index)
        simulateData.addAction(at: index, value: newElement.convertToString())
    }
    
    private func deleteFirst() {
        guard let simulateData = delegateSimulateController else { return }
        usingModel.deleteElement(at: 0)
        simulateData.deleteAction(at : 0)
    }
    
    private func deleteLast() {
        guard let simulateData = delegateSimulateController else { return }
        let index = usingModel.count - 1
        usingModel.deleteElement(at: index)
        simulateData.deleteAction(at : index)
    }
    
}


