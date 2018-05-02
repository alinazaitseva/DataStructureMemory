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
        default:
            return StackTypeStructure()
        }
    }
}

