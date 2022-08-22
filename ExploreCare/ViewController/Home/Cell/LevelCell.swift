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
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    public var category: Category?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func updateCategoryCell() {
        backgroundImage.image = category?.categoryImage
        titleLabel.text = category?.categoryName
    }

}
