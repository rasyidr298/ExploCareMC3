//
//  HelpModalVC.swift
//  ExploreCare
//
//  Created by Rasyid Ridla on 24/08/22.
//

import UIKit

protocol HelpModalDelegate: AnyObject {
    func onCloseButton()
}

class HelpModalVC: UIViewController {
    weak var delegate: HelpModalDelegate?
    
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true) {
            self.delegate?.onCloseButton()
        }
    }
}
