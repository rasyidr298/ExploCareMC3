//
//  InputNameViewController.swift
//  UI Tepug
//
//  Created by Steffani Sylvia on 22/08/22.
//

import UIKit

class InputNameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let nameField: NameField = .loadFromNib()
        nameField.center = view.center
        nameField.frame.origin.y -= 15
        nameField.layer.cornerRadius = 30
//
//        nameFieldCell.fieldTitle.font = UIFont(name: "SFProRoundedSemibold", size: 20)
        
//        nameFieldCell.enterButton.layer.cornerRadius = 32
//        nameFieldCell.enterButton.backgroundColor = .init(red: 0.76, green: 0.93, blue: 1.00, alpha: 1.00)
        
        // Do any additional setup after loading the view.
        view.addSubview(nameField)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
