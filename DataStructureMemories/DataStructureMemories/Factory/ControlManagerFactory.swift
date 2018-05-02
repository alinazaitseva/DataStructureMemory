//
//  ControlManagerFactory.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/30/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class ControlManagerFactory: ControlManagerFactoryProtocol {
    func getManagerController(type: ATDTypes) -> ControlManagerProtocol {
        switch type {
        case .stack: do {
            return StackTypeStructure()
        }
        default:
            return StackTypeStructure()
        }
    }
    
}
