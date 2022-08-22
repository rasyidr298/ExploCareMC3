//
//  ResultModalVC.swift
//  ExploCare-ARKit
//
//  Created by cleanmac-ada on 20/08/22.
//

import UIKit

class ResultModalVC: UIViewController {
    
    // MARK: - IBOutlets and UI Components
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var objectNameLabel: UILabel!
    @IBOutlet weak var objectDescriptionLabel: UILabel!
    @IBOutlet weak var voiceOverButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    // MARK: - Variables
    
    // MARK: - Overriden Functions
    init() {
        super.init(nibName: "ResultModalVC", bundle: nil)
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
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
        resultImage.layer.borderColor = UIColor(hex: "#ADC6F6").cgColor
        resultImage.layer.borderWidth = 2
        
        let attStr = NSMutableAttributedString(string: "Tep orders a", attributes: [.font: UIFont.boldSystemFont(ofSize: 15), .foregroundColor: UIColor.black])
        attStr.append(NSAttributedString(string: " banana ", attributes: [.font: UIFont.boldSystemFont(ofSize: 15), .foregroundColor: UIColor(hex: "#5B8DEE")]))
        attStr.append(NSAttributedString(string: "split.", attributes: [.font: UIFont.boldSystemFont(ofSize: 15), .foregroundColor: UIColor.black]))
        objectDescriptionLabel.attributedText = attStr
    }
    
    // MARK: - Custom Functions

    // MARK: - Actions
    @IBAction func nextAction(_ sender: Any) {
        dismiss(animated: true)
    }
}
