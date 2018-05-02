//
//  ActionButton.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/30/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

class ActionButton: UIButton {
    var action: ( ()->() )?
    init(title: String, action: ( ()->() )? = nil) {
       super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(.yellow, for: .normal)
        self.action = action
        self.setupTarget()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func callToAction() {
            action?()
    }
    
    func setupTarget() {
        self.addTarget(self, action: #selector(callToAction),for: .touchUpInside)
    }
}
