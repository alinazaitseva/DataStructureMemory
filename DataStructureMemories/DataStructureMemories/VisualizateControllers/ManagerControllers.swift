//
//  ManagerController.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/27/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class ManagerContoller: ControlManagerFactoryProtocol {
    
    func getManagerController(type: ATDTypes) -> ControlManagerProtocol {
        switch type {
        case .stack:
            return StackTypeStructure()
        case .queue:
            return QueneTypeStructure()
        case .set:
            return SetTypeStructure()
        case .dequeue:
            return DequeueTypestructure()
        case .priorityqueue:
            return PriorityQueueTypeStructure()
        case .list:
            return ListTypeStructure()
        case .multiset:
            return MultiSetTypeStructure()
        case .dictionary:
            return DictionaryTypeStructure()
        }
    }
}

