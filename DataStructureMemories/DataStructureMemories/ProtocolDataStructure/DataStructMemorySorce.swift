//
//  DataStructMemorySorce.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/13/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

protocol DataStructureMemorySorce {
    
    var listOfDataStructure: [String] { get }
    
    func getValueInDataSource(item: Int) -> String
    
    func amountOfValuesInDataSorce() -> Int

}


