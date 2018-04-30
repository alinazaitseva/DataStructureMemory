//
//  AdaptationController.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/30/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

class AdaptationController: AdaptationProtocol {
    
    func placeButtonsMenu(manager: ATDControlProtocol, view: UIStackView) {
        var placedArray: [TypesOfButtons]
        placedArray = manager.createButtonsMenu()
        placedArray.forEach { item in
            switch item {
            case .button(let title, let action):
                view.addArrangedSubview(ActionButton(title: title, action: action))
            }
        }
    }
    
   
}
