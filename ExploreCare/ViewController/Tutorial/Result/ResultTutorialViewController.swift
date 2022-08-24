//
//  ResultTutorialViewController.swift
//  ExploreCare
//
//  Created by Rasyid Ridla on 23/08/22.
//

import UIKit

class ResultTutorialViewController: UIViewController {
    
    @IBOutlet weak var tutorialLabel: UILabel!
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tutorialLabel.text = "Great! You found the \(category?.object[0].name ?? "")!\n Now, you’re ready to explore. Let’s go!"
        
        AVService.shared.tutorialSound(type: "Found To Explore")
    }
    
    @IBAction func closeButton(_ sender: Any) {
        let vc = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func startExplore(_ sender: Any) {
        let udIsShowTutorial = UserDefaults.standard.bool(forKey: udIsShowTutorialKey)
        if udIsShowTutorial {
            let vc = HomeVC()
            navigationController?.pushViewController(vc, animated: true)
        }else {
            UserDefaults.standard.set(true, forKey: udIsShowTutorialKey)
            let vc = ObjectRecogViewController()
            vc.isTutorial = false
            vc.category = category
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
