//
//  AppDelegate.swift
//  learnEnglish
//
//  Created by Rasyid Ridla on 21/06/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var orientationLock = UIInterfaceOrientationMask.all

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController: UINavigationController!
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if !udIsShowOnBoard {
            let vc = UIStoryboard(name: "OnboardingViewController", bundle: nil).instantiateViewController(withIdentifier: "OnboardingViewController")
            navigationController = UINavigationController(rootViewController: vc)
        } else {
            navigationController = UINavigationController(rootViewController: HomeVC())
        }
        
        navigationController.setNavigationBarHidden(true, animated: false)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        .landscapeRight
    }
}


