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
    private let titleATD: String
    private let typesOfATD: ATDTypes
    
    func titleOfString() -> String {
        return title.self
    }
    
    func descrOfString() -> String {
        return descr.self
    }
    func getWikiLink() -> String {
        return link.self
    }
    
    init(title: String, description: String, link: String, titleATD: String, typesOfATD: ATDTypes) {
        self.title = title
        self.descr = description
        self.link = link
        self.titleATD = titleATD
    }
}

    enum ATDTypes {
        case stack
        case queue
        case set
        case dequeue
        case priorityQueue
        case list
        case multiSet
        case dictionary
    }
