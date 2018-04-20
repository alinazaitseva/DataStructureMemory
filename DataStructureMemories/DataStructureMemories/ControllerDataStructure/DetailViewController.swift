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
    @IBOutlet weak var buttonToggle: UIButton!
    
    public var titleStructure: String?
    public var detailDescription: String?
    public var srtuctureCell: DataStructMemory?
   
    var isDoing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = srtuctureCell?.titleOfString() ?? "There is no such title"
        self.descriptionValue.text = srtuctureCell?.descrOfstring() ?? "There is no such description"
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
        let hideText = heightConstraint.priority = UILayoutPriority(rawValue: 250)
        gradientView.isHidden = true
        view.layoutIfNeeded()
        let titleMore = "More"
        let titleLess = "Less"
         buttonToggle.setTitle(titleLess, for: UIControlState.normal)
//        if isDoing {
//
//
//        }
    
    }
    
    
    @IBAction func animateButtonMore(_ sender: UIButton) {
        UIView.animate(withDuration: 1.6, animations: {
            self.buttonToggle.frame.origin.y -= 20
        }, completion: nil)
        view.layoutIfNeeded()
    }
}
//    @IBAction func buttonHideText(_ sender: Any) {
//        heightConstraint.priority = UILayoutPriority(rawValue: 999)
//        gradientView.isHidden = false
//        view.layoutIfNeeded()
//    }

extension UIView {
    func opacityGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 1.0]
        self.layer.mask = gradient
    }
}

extension UIButton {
    func setTitle(_ title: String) {
        self.setTitle(title, for: .normal)
        self.setTitle(title, for: .disabled)
        self.setTitle(title, for: .focused)
    }
}
