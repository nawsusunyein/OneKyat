//
//  CommonOperations.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/29/22.
//

import Foundation
import UIKit

class CommonOperations{
    static let shared = CommonOperations()
    
    //Call given phone number
    func callPhoneNumber(phoneNumer : String){
        if let url = URL(string: "tel://\(phoneNumer)") {
             UIApplication.shared.open(url)
         }
    }
    
    
    //Go to login screen
    func showLoginScreen(){
        let storyboard = UIStoryboard(name : "Main", bundle : nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewControllerIdentifier") as! ViewController
        let nav = UINavigationController()
        nav.viewControllers = [loginVC]
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = nav
    }
    
    //To show home screen if user is already logged in
    func showHomeScreen(){
        let storyboard = UIStoryboard(name : "MainTabBar", bundle : nil)
        let mainTabVC = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = mainTabVC
    }
   
   
}
