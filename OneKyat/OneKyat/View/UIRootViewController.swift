//
//  UIRootViewController.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/29/22.
//

import UIKit

class UIRootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCustomBackImageInNavigation()
    }
    
    
    //Set navigation attributes which will be used at most of screens
    func setNavigationBarAttributes(title : String){
        
        //set navigation bar color
        self.navigationController?.navigationBar.barTintColor = ButtonColor.LoginButton.enabledColor
        
        //set navigation title color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        //set navigation back button color
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.title = title
        
    }

    
    //Show navigation bar on top of screen
    func showNavigationBar(){
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    //Set custom back button image in navigation bar
    func setCustomBackImageInNavigation(){
        let backImage = UIImage(named: "back")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(UINavigationController.popViewController(animated:)))
        
    }
}
