//
//  NameField.swift
//  UI Tepug
//
//  Created by Steffani Sylvia on 22/08/22.
//

import Foundation
import UIKit

class NameField: UIView {
    @IBOutlet weak var fieldTitle: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var nameFill: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        setupCollectionView()
        fieldTitle.font = UIFont(name: "SFProRoundedBold", size: 20)
        enterButton.layer.cornerRadius = 24
    }
    
    private func setupCollectionView() {
//        NameField.delegate = self
//        InputNameViewController.dataSource = self
//        InputNameViewController.register(UINib(nibName: "LevelCell", bundle: nil), forCellWithReuseIdentifier: LevelCell.REUSE_IDENTIFIER)
    }
    override init(frame: CGRect){
        super.init(frame: frame)
//        viewInit()
    }
    required init?(coder: NSCoder){
        super.init(coder: coder)
//        Bundle.main.loadNibNamed("NameField", owner: self, options: nil)
//        self.addSubview(self)
//        viewInit()
    }
    func viewInit(){
        let nib = Bundle.main.loadNibNamed("NameField", owner: self, options: nil)?.first as! UIView
//        let nib = UINib(nibName: "NameField", bundle: nil)
        nib.frame = self.bounds
        addSubview(nib)
    }
}
