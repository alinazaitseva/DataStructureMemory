//
//  ATDControlProtocol.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/26/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

protocol ControlManagerProtocol {
    var delegateSimulateController: SimulateControllerProtocol? { get set }
    var buttonsMenu: [TypeOfButtons] { get }
}
