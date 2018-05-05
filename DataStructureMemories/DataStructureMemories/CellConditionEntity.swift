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
    let extraValue: String
    let inputedValue: String
   
    init (value: Int = 0, descriptionValue: String = "", extraValue: String = "", inputedValue: String = ""  ) {
        self.value = value
        self.descriptionValue = ""
        self.extraValue = ""
        self.inputedValue = ""
    }
    
    func convertToString() -> String {
        var result = ""
        if descriptionValue == "" {
            result += String( self.value )
        } else {
             result += self.descriptionValue + ": " + String(self.value)
        }
        if self.extraValue != "" {
            result += ", " + self.descriptionValue + ": " + String(self.extraValue)
                    }
         return result
    }
}

