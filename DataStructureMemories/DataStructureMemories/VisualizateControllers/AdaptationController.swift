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
        let placedArray: [TypesOfButtons] = manager.createButtonsMenu()
        placedArray.forEach { value in
            switch value {
            case .button(let titleButton, let actionButton):
                view.addArrangedSubview(ActionButton(title: titleButton, action: actionButton))
            }
        }
    }
}
