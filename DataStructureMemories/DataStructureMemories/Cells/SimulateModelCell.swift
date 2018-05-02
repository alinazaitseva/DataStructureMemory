//
//  ModelCell.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 5/2/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class SimulateModelCell {
    private var data: [CellConditionEntity] = []
    
        var count: Int {
            get {
                return data.count
            }
        }
        func add(atIndex: Int, element: CellConditionEntity) {
            data.insert(element, at: atIndex)
        }
    
        func delete(atIndex: Int) {
            if !data.indices.contains(atIndex) {return}
            
            data.remove(at: atIndex)
        }
        func getElement(atIndex: Int) -> CellConditionEntity? {
            if data.indices.contains(atIndex) {
                return data[atIndex]
            } else {
                return nil
            }
        }
    
}
