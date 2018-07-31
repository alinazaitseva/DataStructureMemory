//
//  DataStructureCell.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/12/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class DataStructureCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}

extension DataStructureCell: ConfigurableCellProtocol {
    func configure(with model: DataStructEntity) {
        titleLabel.text = model.titleOfString
    }
}
