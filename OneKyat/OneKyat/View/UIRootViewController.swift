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
        self.setNavigationBarAndButtonColor()
    }
    
    
    //Set navigation attributes which will be used at most of screens
    func setNavigationBarAttributes(title : String){
        
        //set navigation title color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
 
        self.title = title
        
    }

    
    //Show navigation bar on top of screen
    func showNavigationBar(){
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    //Hide navigation bar on top of screen
    func hideNavigationBar(){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    //Set custom back button image in navigation bar
    func setCustomBackImageInNavigation(){
        let backImage = UIImage(named: "back")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        
        self.navigationItem.leftItemsSupplementBackButton = true
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        
    }
    
    
    //Set search bar in navigation bar
    func setSearchBarinNavigationBar(){
    
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = .white
        
        //set search textfield background color and placeholder color above ios 13.0
        if #available(iOS 13.0, *) {
            
            searchController.searchBar.searchTextField.backgroundColor = UIColor.white
            searchController.searchBar.searchTextField.layer.cornerRadius = 5
            searchController.searchBar.searchTextField.attributedPlaceholder =  NSAttributedString(string: "Search at One Kyat", attributes: [NSAttributedString.Key.foregroundColor: ButtonColor.LoginButton.enabledColor])
            
        }else if #available(iOS 11.0, *) { //set search textfield background color and placeholder color above ios 11.0
            
            if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
                if let backgroundview = textfield.subviews.first {

                    // Background color
                    backgroundview.backgroundColor = UIColor.white

                    // Rounded corner
                    backgroundview.layer.cornerRadius = 5
                    backgroundview.clipsToBounds = true
                }
               
                
                UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Search at One Kyat", attributes: [NSAttributedString.Key.foregroundColor: ButtonColor.LoginButton.enabledColor])
            }
        }
        
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.definesPresentationContext = true
    }
    
    
    //Set navigation bar and button color
    func setNavigationBarAndButtonColor(){
        //set navigation bar color
        self.navigationController?.navigationBar.barTintColor = ButtonColor.LoginButton.enabledColor
        
        //set navigation back button color
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    
    //Set custom  button image in right item of navigation bar
    func setCustomButtonAtRighInNavigation(iconName: String){
        
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: iconName), style: .done, target: self, action: #selector(logout))
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
    }
    
    
    //Logout app
    @objc func logout(){
        UserDefaults.standard.setValue(TextValue.notLogin, forKey: Keys.isLogged)
        CommonOperations.shared.showLoginScreen()
    }
}
