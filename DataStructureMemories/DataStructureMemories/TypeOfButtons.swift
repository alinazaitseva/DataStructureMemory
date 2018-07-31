//
//  TypesOfButtons.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/30/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

enum TypeOfButtons {
    case button(title: String, action: ()->() )
    case textField(placeholder: String, keyboardType: UIKeyboardType, action:( (String)->() )?)
}
