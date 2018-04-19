//
//  DetailViewController.swift
//  DataStructureMemories
//
//  Created by Alina Zaitseva on 4/16/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//
import UIKit

class DetailViewController: UIViewController {
    
   @IBOutlet weak var descriptionValue: UILabel!
    
    public var titleStructure: String?
    public var detailDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleStructure ?? "There is no such title"
        self.descriptionValue.text = detailDescription ?? "There is no such description"
        gradientView.opacityGradient()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var gradientView: UIView!
    var gradientLayer: CAGradientLayer!

    @IBOutlet weak var halfHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var fullHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBAction func buttonShowText(_ sender: Any) {
        heightConstraint.priority = UILayoutPriority(rawValue: 250)
        gradientView.isHidden = true
        view.layoutIfNeeded()
    }
}
extension UIView {
    func opacityGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 1.0]
        self.layer.mask = gradient
    }
}
