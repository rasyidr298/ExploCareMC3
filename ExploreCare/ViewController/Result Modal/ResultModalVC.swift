//
//  ResultModalVC.swift
//  ExploCare-ARKit
//
//  Created by cleanmac-ada on 20/08/22.
//

import UIKit

protocol ResultModalDelegate: AnyObject {
    func onNextButttonPressed()
    func onSpeakerButttonPressed(object: ObjectRecog)
}

class ResultModalVC: UIViewController {
    
    // MARK: - IBOutlets and UI Components
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var objectNameLabel: UILabel!
    @IBOutlet weak var objectDescriptionLabel: UILabel!
    @IBOutlet weak var voiceOverButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    // MARK: - Variables
    weak var delegate: ResultModalDelegate?
    
    private var object: ObjectRecog!
    private var index: Int!
    
    // MARK: - Overriden Functions
    init(object: ObjectRecog, index: Int) {
        super.init(nibName: "ResultModalVC", bundle: nil)
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
        
        self.object = object
        self.index = index
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setups
    private func setupUI() {
        resultImage.image = object.objectImage
        
        objectNameLabel.text = object.objectName.capitalized
        objectDescriptionLabel.text = object.descriptionName
        
        if index == 5 {
            nextButton.setTitle("Finish", for: .normal)
        }
    }
    
    // MARK: - Custom Functions

    // MARK: - Actions
    @IBAction func nextAction(_ sender: Any) {
        dismiss(animated: true) { [unowned self] in
            delegate?.onNextButttonPressed()
        }
    }
    
    @IBAction func voiceOverAction(_ sender: Any) {
        delegate?.onSpeakerButttonPressed(object: object)
    }
    
}
