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
                return data.count
        }
    func add(element: CellConditionEntity, at index: Int ) {
            data.insert(element, at: index)
        }
    
        func deleteElement(at index: Int ) {
            if !data.indices.contains(index) {return}
            data.remove(at: index)
        }
    func getElement(at index: Int) -> CellConditionEntity? {
            if data.indices.contains(index) {
                return data[index]
            } else {
                return nil
            }
        }
    
}
