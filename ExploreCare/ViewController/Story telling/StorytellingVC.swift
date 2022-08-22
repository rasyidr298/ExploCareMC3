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
    
    var category: Category?
    
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
        levelDescriptionLabel.text = category?.storyTellingText
        levelNameLabel.text = category?.categoryName
    }
    
    // MARK: - Custom Functions
    
    // MARK: - Actions
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func startAction(_ sender: Any) {
        guard let window = UIApplication.shared.keyWindow else {return}
        let vc = ObjectRecogViewController()
        vc.category = category
        window.rootViewController = vc
    }
}

// MARK: - Collection view delegate and data source
extension StorytellingVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        (category?.object.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: StorytellingObjectCell.CELL_WIDTH, height: StorytellingObjectCell.CELL_HEIGHT)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StorytellingObjectCell.REUSE_IDENTIFIER, for: indexPath) as! StorytellingObjectCell
        cell.setupContents(category: category!)
        return cell
    }
    
}
