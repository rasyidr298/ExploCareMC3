//
//  OnboardingCollectionViewCell.swift
//  ExploreCare
//
//  Created by Rahmat Rizky on 23/08/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var illuImageView: UIImageView!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var leftCharView: UIImageView!
    @IBOutlet weak var rightCharView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    

    func setup(_ slide: OnboardingSlide) {
        bgImageView.image = slide.bg
        illuImageView.image = slide.illu
        leftCharView.image = slide.leftChar
        rightCharView.image = slide.rightChar
        titleLabel.text = slide.title
        descLabel.text = slide.description
    }
    
}


