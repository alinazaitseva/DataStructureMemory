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
    
    func createButtonsMenu() -> [TypesOfButtons] {
        var arrayItems: Array<TypesOfButtons> = []
       
        arrayItems.append(TypesOfButtons.button(title: "Push") {
            self.add()
        })
            arrayItems.append(TypesOfButtons.button(title: "Pop") {
                self.delete()
        })
           return arrayItems
    }
    
    private func add() {
        guard let simulateData = delegateSimulateController else { return }
        
        let index = simulateData.getLength() - 1
        if simulateData.getElement(byIndex: index) != nil {
            guard let value = simulateData.getElement(byIndex: 0)
                else { return }
            let newValue = value + 1
            simulateData.addAction(atIndex: 0, value: newValue)
            
        }
        else {
            simulateData.addAction(atIndex: 0, value: 0)
        }
    }
    private func delete() {
        delegateSimulateController?.deleteAction(atIndex: 0)
    }

}
