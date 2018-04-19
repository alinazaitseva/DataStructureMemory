//
//  DataStructEntity.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/17/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class DataStructEntity: DataStructMemory {
    
    private let title: String
    private let descr: String
    
    func returnTitleOfString() -> String {
        return title.self
    }
    
    func returnDescrOfstring() -> String {
        return descr.self
    }
    
    init(title: String, description: String) {
        self.title = title
        self.descr = description
    }
    
}

