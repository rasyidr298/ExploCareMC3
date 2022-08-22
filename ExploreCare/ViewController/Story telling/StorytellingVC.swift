//
//  StorytellingVC.swift
//  ExploreCare
//
//  Created by cleanmac-ada on 22/08/22.
//

import UIKit

class StorytellingVC: UIViewController {

    // MARK: - IBOutlets and UI Components
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var levelNameLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var levelDescriptionLabel: UILabel!
    
    @IBOutlet weak var objectsCollectionView: UICollectionView!
    
    // MARK: - Variables

    // MARK: - Overriden Functions
    init() {
        super.init(nibName: "StorytellingVC", bundle: nil)
        modalPresentationStyle = .overCurrentContext
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
        objectsCollectionView.delegate = self
        objectsCollectionView.dataSource = self
        objectsCollectionView.allowsSelection = false
        objectsCollectionView.register(UINib(nibName: "StorytellingObjectCell", bundle: nil), forCellWithReuseIdentifier: StorytellingObjectCell.REUSE_IDENTIFIER)
    }
    
    // MARK: - Custom Functions
    
    // MARK: - Actions
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func startAction(_ sender: Any) {
        
    }
}

// MARK: - Collection view delegate and data source
extension StorytellingVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: StorytellingObjectCell.CELL_WIDTH, height: StorytellingObjectCell.CELL_HEIGHT)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StorytellingObjectCell.REUSE_IDENTIFIER, for: indexPath) as! StorytellingObjectCell
        cell.setupContents(imageName: "ic_backpack")
        return cell
    }
    
}
