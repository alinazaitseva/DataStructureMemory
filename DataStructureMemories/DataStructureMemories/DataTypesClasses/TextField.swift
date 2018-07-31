//
//  SimulateTextField.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 5/3/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

class TextField: UITextField, UITextFieldDelegate {
    var callToAction: ( (String) ->()? )?
        
    init(placeholder: String, keyboardType: UIKeyboardType, action: ((String)->())?) {
        super.init(frame: .zero)
        self.callToAction = action
        self.borderStyle = .roundedRect
        self.autoresizesSubviews = false
        self.keyboardType = keyboardType
        self.placeholder = placeholder
        self.delegate = self
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textField(textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        
        let aCharacterSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let permissibleCharacters = string.components(separatedBy: aCharacterSet).joined(separator: "")
        let newLength = text.count + string.count - range.length
        let maxSize = 4
        if (string == permissibleCharacters || self.keyboardType != .decimalPad) && newLength <= maxSize {
            if let text = text as? NSString {
                let result = text.replacingCharacters(in: range, with: string)
                callToAction!(result)
                return true
            }
        }
        return false
    }
}
