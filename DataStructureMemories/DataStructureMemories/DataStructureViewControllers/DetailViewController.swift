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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = dataCell?.titleOfString ?? "There is no such title"
        self.descriptionValue.text = dataCell?.descriptionOfString ?? "There is no such description"
        gradientView.addOpacityGradient()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //assumed name
    typealias Presentation = (title: String, priority: Int, isGradientHidden: Bool)
    var isShowingText = false
        {
        didSet{
            self.updatePresentation()
        }
    }
    var presentation: Presentation {
        return(title: isShowingText ? "Less":"More", priority: isShowingText ? 999:250, isGradientHidden: isShowingText)
    }
    private func updatePresentation() {
        let presentation = self.presentation
    }
    
    @IBAction func buttonShowText(_ sender: Any) {
        self.isShowingText = !self.isShowingText
    }
    @IBAction func pathToLinksToWiki(_ sender: Any) {
    
        let actionSheetController: UIAlertController = UIAlertController( title: "Please select", message: "Option to select", preferredStyle: .actionSheet)
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) {
            _ in
            print("Cancel")
        }
        actionSheetController.addAction(cancelActionButton)
        
        var giveWayToUIWebViewController: ((UIAlertAction) -> Void) {
            return { _ in
                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let uiWebController = mainStoryboard.instantiateViewController(withIdentifier: "UIWebViewController") as? UIWebViewController
                
                uiWebController?.exactURL = self.dataCell?.getWikiLink
                self.present(uiWebController!, animated: true)
            }
        }
        let uiWebViewAction = UIAlertAction(title: "UIWebViewAction", style: .default) { (giveWayToUIWebViewController) in
             print("webUIView")
        }
        actionSheetController.addAction(uiWebViewAction)
        
        var giveWayToWKWebViewController: ((UIAlertAction) -> Void) {
            return { _ in
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let navigationWKController = mainStoryboard.instantiateViewController(withIdentifier: "showWK") as? WKWebNavigationViewController
                navigationWKController?.exactURL = self.dataCell?.getWikiLink
            self.present(navigationWKController!, animated: true)
            }
        }
        let webKitView = UIAlertAction(title: "WebViewAction", style: .default) { (giveWayToWKWebViewController) in
             print("webKitView")
        }
        actionSheetController.addAction(webKitView)
        
        var giveWayToSFSafaryViewController: ((UIAlertAction) -> Void) {
            return { _ in
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
           let sfSafaryViewController = mainStoryboard.instantiateViewController(withIdentifier: "SFSafaryViewController") as? SFSafaryViewController
            sfSafaryViewController?.exactURL = self.dataCell?.getWikiLink
            self.present(sfSafaryViewController!, animated: true)
            }
        }
        
        let sfSafary = UIAlertAction(title: "SfSafaryAction", style: .default) { (giveWayToSFSafaryViewController) in
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
