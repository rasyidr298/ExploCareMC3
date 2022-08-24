//
//  InputNameViewController.swift
//  UI Tepug
//
//  Created by Steffani Sylvia on 22/08/22.
//

import UIKit

class InputNameViewController: UIViewController {
    
    private let nameField: NameField = .loadFromNib()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.center = view.center
        nameField.frame.origin.y -= 60
        nameField.layer.cornerRadius = 30
//
//        nameFieldCell.fieldTitle.font = UIFont(name: "SFProRoundedSemibold", size: 20)
        
//        nameFieldCell.enterButton.layer.cornerRadius = 32
//        nameFieldCell.enterButton.backgroundColor = .init(red: 0.76, green: 0.93, blue: 1.00, alpha: 1.00)
        view.addSubview(nameField)
        
        nameField.enterButton.addTarget(self, action: #selector(enterAction), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AVService.shared.playMusic(name: "inputName1", type: "mp3")
    }
    
    @objc private func enterAction() {
        UserDefaults.standard.set(nameField.nameFill.text ?? "", forKey: udUserNameKey)
        navigationController?.pushViewController(HomeVC(), animated: true)
    }

}
