//
//  DataStructEntity.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/17/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class DataStructEntity: DataStructureProtocol {
   
    var titleOfString: String {
        get {
            return title.self
        }
    }
    var descriptionOfString: String {
        get {
            return description.self
        }
    }
    var getWikiLink: String {
        get {
            return link.self
        }
    }
    
    private let title: String
    private let description: String
    private let link: String
    
    init(title: String, description: String, link: String) {
        self.title = title
        self.description = description
        self.link = link

    }
}
