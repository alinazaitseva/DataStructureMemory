//
//  DataStructMemoryList.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/13/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class DataCaprureMemoryStructModel: DataStructureMemorySorce{

    
    var listOfDataStructure: [String] {
        
        return ["Stack","Queue","Set","Dequeue","Priority Queue","List(Array)", "MultiSet","Dictionary"]
    }
    
    func getValueInDataSource( item: Int ) -> String {
      
        return listOfDataStructure[item]
        
    }
    
    func amountOfValuesInDataSorce() -> Int {
        <#code#>
    }
    
    

    
}
