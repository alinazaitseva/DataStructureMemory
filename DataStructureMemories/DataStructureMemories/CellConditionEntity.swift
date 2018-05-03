//
//  CurrentCellCondition.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 5/2/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

struct CellConditionEntity {
    let value: Int
    let descriptionValue: String
    let condition: Condition
    var listOfValuesInArray: [CellConditionEntity] = []
   
    init (value: Int = 0, descriptionValue: String = "item" ) {
        self.value = value
        self.descriptionValue = ""
        self.condition = .forward
    }
    
    func convertToString() -> String {
        var result = String()
        if descriptionValue == "" {
            result += String( self.value )
        } else {
             result += self.descriptionValue + ": " + String(self.value)
        }
         return result  
    }
   
}

enum Condition {
    case forward
    case previous
}

