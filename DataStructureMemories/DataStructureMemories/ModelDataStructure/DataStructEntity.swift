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
    private let link: String
    
    func titleOfString() -> String {
        return title.self
    }
    
    func descrOfString() -> String {
        return descr.self
    }
    func getWikiLink() -> String {
        return link.self
    }
    
    init(title: String, description: String, link: String) {
        self.title = title
        self.descr = description
        self.link = link
    }
    
}

