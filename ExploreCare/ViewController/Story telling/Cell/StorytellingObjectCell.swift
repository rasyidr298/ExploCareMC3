//
//  StorytellingObjectCell.swift
//  ExploreCare
//
//  Created by cleanmac-ada on 22/08/22.
//

import UIKit

class StorytellingObjectCell: UICollectionViewCell {
    
    static let REUSE_IDENTIFIER = "StorytellingObjectCell"
    static let CELL_WIDTH: CGFloat = 95
    static let CELL_HEIGHT: CGFloat = 106
    
    @IBOutlet weak var objectImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupContents(imageName: String) {
        objectImage.image = UIImage(named: imageName)
    }

}
