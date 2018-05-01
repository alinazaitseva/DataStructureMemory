//
//  SimulateControllerProtocol.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/30/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

protocol SimulateControllerProtocol: class {
    func addAction(atIndex: Int, value: Int)
    func deleteAction(atIndex: Int)
    func getElement(byIndex: Int) -> Int?
    func getLength() -> Int
}
