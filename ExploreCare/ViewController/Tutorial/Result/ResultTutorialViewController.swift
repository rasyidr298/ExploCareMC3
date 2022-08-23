//
//  ResultTutorialViewController.swift
//  ExploreCare
//
//  Created by Rasyid Ridla on 23/08/22.
//

import UIKit

class ResultTutorialViewController: UIViewController {
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButton(_ sender: Any) {
        let vc = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func startExplore(_ sender: Any) {
        if udIsShowTutorial {
            let vc = HomeVC()
            navigationController?.pushViewController(vc, animated: true)
        }else {
            let vc = ObjectRecogViewController()
            vc.isTutorial = false
            vc.category = category
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
