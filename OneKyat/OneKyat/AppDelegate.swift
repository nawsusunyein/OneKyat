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
        if let isLogged = UserDefaults.standard.string(forKey: Keys.isLogged){
            if(isLogged == TextValue.notLogin) // user is not logged in
            {
                CommonOperations.shared.showLoginScreen()
            }else{
                CommonOperations.shared.showHomeScreen()
            }
        }else{
            //user is new user
            UserDefaults.standard.setValue(TextValue.notLogin, forKey: Keys.isLogged)
        }
    }
    
   
    
   

}

