//
//  ATDControlFactoryProtocol.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/30/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

protocol ControlManagerFactoryProtocol {
    func getManagerController(type: ATDType) -> ControlManagerProtocol
}
