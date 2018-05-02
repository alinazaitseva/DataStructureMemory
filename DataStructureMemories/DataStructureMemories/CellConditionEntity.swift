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


//struct CellEntity: CellEntityProtocol {
//        var value: Int
//        var descriptionValue: String
//        var extraValue: Int
//        var descriptionExtraValue: String
//        var status: Status
//
//        init(value: Int = 0, descr: String = "value") {
//               self.value = value
//                   self.descriptionValue = ""
//                    self.extraValue = 0
//                    self.descriptionExtraValue = ""
//                    self.status = .new
//            }
//        init(value: Int = 0, description: String = "", extraValue: Int = 0, descriptionExtraValue: String) {
//                self.value = value
//                    self.descriptionValue = description
//                    self.extraValue = extraValue
//                    self.descriptionExtraValue = descriptionExtraValue
//                   self.status = .new
//            }
//        func toString() -> String {
//                var result = String()
//                if self.descriptionValue == "" {
//                        result += String(self.value)
//                    }
//                else {
//                        result += self.descriptionValue + ": " + String(self.value)
//                    }
//               if self.extraValue != 0 {
//                        result += ", " + self.descriptionExtraValue + ": " + String(self.extraValue)
//                    }
//                return result
//            }
//    }
//
//enum Status {
//        case new
//        case old
//    +}
