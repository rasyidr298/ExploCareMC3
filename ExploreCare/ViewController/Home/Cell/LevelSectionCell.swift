//
//  LevelSectionCell.swift
//  ExploCare-ARKit
//
//  Created by cleanmac-ada on 20/08/22.
//

import UIKit

class LevelSectionCell: UITableViewCell {
    
    static let REUSE_IDENTIFIER = "LevelSectionCell"
    static let CELL_HEIGHT: CGFloat = 265

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var levelsCollectionView: UICollectionView!
    
    private var selectHandler: (Category) -> Void = { _ in }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        levelsCollectionView.delegate = self
        levelsCollectionView.dataSource = self
        levelsCollectionView.register(UINib(nibName: "LevelCell", bundle: nil), forCellWithReuseIdentifier: LevelCell.REUSE_IDENTIFIER)
    }
    
    func setupContents(title: String) {
        titleLabel.text = title
    }
    
    func setupSelectHandler(handler: @escaping (Category) -> Void) {
        selectHandler = handler
    }
    
}

extension LevelSectionCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Category.dataObject().count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: LevelCell.CELL_WIDTH, height: LevelCell.CELL_HEIGHT)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryistData = Category.dataObject()[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LevelCell.REUSE_IDENTIFIER, for: indexPath) as! LevelCell
        cell.category = categoryistData
        cell.updateCategoryCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        selectHandler(Category.dataObject()[indexPath.row])
    }
    
}
