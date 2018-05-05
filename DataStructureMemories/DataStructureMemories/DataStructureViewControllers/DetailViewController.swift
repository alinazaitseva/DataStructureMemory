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
    
    public var dataCell: DataStructureProtocol!
    private let factoryEntity = ControlManagerFactory()
    
    var isShowingText = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = dataCell?.titleOfString ?? "There is no such title"
        self.descriptionValue.text = dataCell?.descriptionOfString ?? "There is no such description"
        gradientView.addOpacityGradient()
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
    
    func giveWayToWKWebViewController() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let navigationWKController = mainStoryboard.instantiateViewController(withIdentifier: "showWK") as? WKWebNavigationViewController else { return }
        navigationWKController.exactURL = dataCell?.getWikiLink
        self.present(navigationWKController, animated: true)
    }
    func giveWayToUIWebViewController() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)

        guard let uiWebController = mainStoryboard.instantiateViewController(withIdentifier: "UIWebViewController") as? UIWebViewController else { return }
            
        uiWebController.exactURL = dataCell?.getWikiLink
        self.present(uiWebController, animated: true)
    }
    func giveWayToSFSafaryViewController() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let sfSafaryViewController = mainStoryboard.instantiateViewController(withIdentifier: "SFSafaryViewController") as? SFSafaryViewController
            else { return }
        sfSafaryViewController.exactURL = dataCell?.getWikiLink
        self.present(sfSafaryViewController, animated: true)
    }
    
    @IBAction func pathToLinksToWiki(_ sender: Any) {
    
        let actionSheetController: UIAlertController = UIAlertController( title: "Please select", message: "Option to select", preferredStyle: .actionSheet)
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) {
            _ in
            print("Cancel")
        }
        actionSheetController.addAction(cancelActionButton)
        
        let uiWebViewAction = UIAlertAction(title: "UIWebViewAction", style: .default) {
            _ in
            print("Save")
            self.giveWayToUIWebViewController()
        }
        actionSheetController.addAction(uiWebViewAction)
        
        let webKitView = UIAlertAction(title: "WebViewAction", style: .default) {
            _ in
            self.giveWayToWKWebViewController()
            print("webKitView")
        }
        actionSheetController.addAction(webKitView)
        
        let sfSafary = UIAlertAction(title: "SfSafaryAction", style: .default) {
            _ in
             self.giveWayToSFSafaryViewController()
            print("sfSafary")
        }
        actionSheetController.addAction(sfSafary)

        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    @IBAction func buttonVisualize(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard( name: "Main", bundle: nil )
        guard let visualizeViewController = mainStoryboard.instantiateViewController(withIdentifier: "VisualizationViewController") as? VisualizationViewController else { return }
        guard let title = dataCell?.titleOfString.lowercased(),
            let type = ATDType(rawValue: title) else { return }
        visualizeViewController.controlManager = factoryEntity.getManagerController(type: type)
        self.navigationController?.pushViewController(visualizeViewController, animated: true)
    }
}

extension UIView {
    func addOpacityGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.white.cgColor]
        gradient.locations = [0.0, 1.0]
        self.layer.mask = gradient
    }
}

extension UIButton {
    func setTitle(_ title: String) {
        self.setTitle(title, for: .normal)
    }
}
