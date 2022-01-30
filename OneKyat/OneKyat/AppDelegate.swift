//
//  AppDelegate.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/28/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.checkAppLoggedInOrNot()
        return true
    }

  
    func checkAppLoggedInOrNot(){
        if let isLogged = UserDefaults.standard.string(forKey: "isLogged"){
            if(isLogged == "0") // user is not logged in
            {
                self.showLoginScreen()
            }else{
                self.showHomeScreen()
            }
        }else{
            //user is new user
            UserDefaults.standard.setValue("0", forKey: "isLogged")
        }
    }
    
    //To show login screen if user is new user or user is not logged in
    func showLoginScreen(){
        let storyboard = UIStoryboard(name : "Main", bundle : nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewControllerIdentifier") as! ViewController
        self.window?.rootViewController = loginVC
    }
    
    
    //To show home screen if user is already logged in
    func showHomeScreen(){
        let storyboard = UIStoryboard(name : "MainTabBar", bundle : nil)
        let mainTabVC = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarViewController
        self.window?.rootViewController = mainTabVC
    }

}

