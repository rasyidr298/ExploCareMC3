//
//  CustomAllertViewController.swift
//  learnEnglish
//
//  Created by Rasyid Ridla on 04/07/22.
//

import UIKit

protocol CustomAlertDelegate: class {
    func onNextButttonPressed(_ alert: CustomAllertViewController, objectRecog: ObjectRecog)
    func onSpeakerButttonPressed(_ alert: CustomAllertViewController, objectRecog: ObjectRecog)
}

class CustomAllertViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var objectImage: UIImageView!
    @IBOutlet weak var objectNameLabel: UILabel!
    
    var objectRecog: ObjectRecog?
    var indextObject = 0
    
    weak var delegate: CustomAlertDelegate?
    
    init() {
        super.init(nibName: "CustomAllertViewController", bundle: Bundle(for: CustomAllertViewController.self))
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func show() {
        if #available(iOS 13, *) {
            UIApplication.shared.windows.first?.rootViewController?.present(self, animated: true, completion: nil)
        } else {
            UIApplication.shared.keyWindow?.rootViewController!.present(self, animated: true, completion: nil)
        }
    }
    
    @IBAction func speakerButton(_ sender: Any) {
        delegate?.onSpeakerButttonPressed(self, objectRecog: objectRecog!)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        delegate?.onNextButttonPressed(self, objectRecog: objectRecog!)
    }
    
    func setupView() {
        AppUtility.lockOrientation(.landscapeRight)
        containerView.layer.cornerRadius = 12
        objectNameLabel.text = objectRecog?.objectName
        objectImage.image = objectRecog?.objectImage
        
        if indextObject >= 5 {
            nextButton.setTitle("Finish", for: .normal)
        }else {
            nextButton.setTitle("Next", for: .normal)
        }
    }
    
}
