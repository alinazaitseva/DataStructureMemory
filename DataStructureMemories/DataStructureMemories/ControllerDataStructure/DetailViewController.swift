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
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var halfHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var fullHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var buttonToggle: UIButton!
    @IBOutlet weak var buttonWiki: UIButton!
    
    public var titleStructure: String?
    public var detailDescription: String?
    public var srtuctureCell: DataStructMemory?
    public var linkToWikiStructure: String?
    
    var isShowingText = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = srtuctureCell?.titleOfString() ?? "There is no such title"
        self.descriptionValue.text = srtuctureCell?.descrOfString() ?? "There is no such description"
        gradientView.opacityGradient()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonShowText(_ sender: Any) {
        let titleMore = "More"
        let titleLess = "Less"
        if isShowingText {
            UIView.transition(with: scrollView, duration: 0.6, options: .transitionCrossDissolve, animations: {
                self.buttonToggle.setTitle(titleMore, for: UIControlState.normal)
                self.isShowingText = false
                self.heightConstraint.priority = UILayoutPriority(rawValue: 999)
                self.gradientView.isHidden = false
            })
        } else {
            UIView.transition(with: scrollView, duration: 0.6, options: .transitionCrossDissolve, animations: {
                self.buttonToggle.setTitle(titleLess, for: UIControlState.normal)
                self.isShowingText = true
                self.heightConstraint.priority = UILayoutPriority(rawValue: 250)
                self.gradientView.isHidden = true
            })
        }
        view.layoutIfNeeded()
    }
//    let actionSheet = AFMActionSheetController()
//    let action = AFMAction(title: "Action", enabled: true, handler: { (action: AFMAction) -> Void in
//        // Do something in handler
//    }
//        actionSheet.add(action)
//        self.present(actionSheet, animated: true, completion: {
//        // Do something after completion
//        })
//
//    let actionSheet: UIAController = UIAlertController(title: "Please select", preferredStyle: .actionSheet)
    
    @IBAction func downloadSheet(_ sender: AnyObject) {
    
    }
    
    @IBAction func animateButtonMore(_ sender: UIButton) {
        UIView.animate(withDuration: 1.6, animations: {
            self.buttonToggle.frame.origin.y -= 20
        }, completion: nil)
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

extension UIButton {
    func setTitle(_ title: String) {
        self.setTitle(title, for: .normal)
        self.setTitle(title, for: .disabled)
        self.setTitle(title, for: .focused)
    }
}
