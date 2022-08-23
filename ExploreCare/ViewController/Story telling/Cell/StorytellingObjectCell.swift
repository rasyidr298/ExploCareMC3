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
    
    func setupContents(object: ObjectRecog) {
        objectImage.image = object.objectImage
//        objectImage.image = category.object[2].objectImage
//        objectImage.image = category.object[3].objectImage
//        objectImage.image = category.object[4].objectImage
//        _ = category.object.map({ obj in
//            objectImage.image = obj.objectImage
//        })
    }

}
