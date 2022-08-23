//
//  TutorialContentViewController.swift
//  ExploreCare
//
//  Created by Rasyid Ridla on 23/08/22.
//

import UIKit

class TutorialContentViewController: UIViewController {

    @IBOutlet weak var bgContent: UIImageView!
    
    var index = 0
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    func setupView() {
        bgContent.image = image
    }

}
