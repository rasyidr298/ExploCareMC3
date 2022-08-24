//
//  AppDelegate.swift
//  learnEnglish
//
//  Created by Rasyid Ridla on 21/06/22.
//

import UIKit
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var orientationLock = UIInterfaceOrientationMask.all

    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()

        window = UIWindow(frame: UIScreen.main.bounds)
        
        
        if !udIsShowOnBoard {
            let vc = UIStoryboard(name: "OnboardingViewController", bundle: nil).instantiateViewController(withIdentifier: "OnboardingViewController")
            window?.rootViewController = vc
        }else {
            window?.rootViewController = TabExploreViewController()
        }
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }
}


