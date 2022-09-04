//
//  LevelCell.swift
//  ExploCare-ARKit
//
//  Created by cleanmac-ada on 20/08/22.
//

import UIKit

class LevelCell: UICollectionViewCell {
    
    static let REUSE_IDENTIFIER = "LevelCell"
    static let CELL_WIDTH: CGFloat = 257
    static let CELL_HEIGHT: CGFloat = 213
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    public var category: Category?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = 2.0
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        
        titleLabel.layer.shadowColor = UIColor.black.cgColor
        titleLabel.layer.shadowRadius = 3.0
        titleLabel.layer.shadowOpacity = 0.6
        titleLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        titleLabel.layer.masksToBounds = false
    }
    
    public func updateCategoryCell() {
        backgroundImage.image = category?.categoryImage
        titleLabel.text = category?.categoryName
    }

}
