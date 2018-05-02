//
//  SimulateVisualCell.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/30/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class SimulateVisualCell: UITableViewCell {

    @IBOutlet weak var simulateLabel: UILabel!
    let identifier = "SimulateVisualCell"

    func setUpUIColor(color: UIColor) {
        UIView.animate(withDuration: 1.3, animations: { self.backgroundColor = color })
    }
}

extension SimulateVisualCell: SimulateCellProtocol {
    func configureWith(data: String) {
        self.simulateLabel.text  = data
    }
}
