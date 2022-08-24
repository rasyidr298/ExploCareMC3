//
//  AdventureModalVC.swift
//  ExploreCare
//
//  Created by cleanmac-ada on 24/08/22.
//

import UIKit

class AdventureModalVC: UIViewController {
    
    // MARK: - Variables
    private var dismissHandler: () -> Void = {}
    
    // MARK: - Overriden Functions
    init() {
        super.init(nibName: "AdventureModalVC", bundle: nil)
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Custom Functions
    func setDismissHanlder(_ handler: @escaping () -> Void) {
        dismissHandler = handler
    }
    
    // MARK: - Actions
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true) { [weak self] in
            self?.dismissHandler()
        }
    }
    
}
