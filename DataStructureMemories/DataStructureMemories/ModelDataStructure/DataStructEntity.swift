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
    private let description: String
    private let link: String
    
    func titleOfString() -> String {
        return title.self
    }
    
    func descrOfString() -> String {
        return description.self
    }
    func getWikiLink() -> String {
        return link.self
    }
    
    init(title: String, description: String, link: String) {
        self.title = title
        self.description = description
        self.link = link

    }
}
