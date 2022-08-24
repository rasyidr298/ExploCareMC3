//
//  HomeVC.swift
//  ExploCare-ARKit
//
//  Created by cleanmac-ada on 20/08/22.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - IBOutlet and UI Components
    @IBOutlet weak var soundStateButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var levelTableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Variables
    private let service = AVService.shared
    
    // MARK: - Overriden Functions
    init() {
        super.init(nibName: "HomeVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateView()
        
        removeOnboardingFromNavigationHierarchy()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !service.isPlayingBackgroundMusic {
            service.playBackgroundMusic()
            soundStateButton.setImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
        }
    }
    
    // MARK: - UI Setups
    private func setupUI() {
        levelTableView.delegate = self
        levelTableView.dataSource = self
        levelTableView.allowsSelection = false
        levelTableView.register(UINib(nibName: "LevelSectionCell", bundle: nil), forCellReuseIdentifier: LevelSectionCell.REUSE_IDENTIFIER)
        
        nameLabel.text = UserDefaults.standard.string(forKey: udUserNameKey)?.capitalized
    }
    
    // MARK: - Custom Functions
    private func updateView() {
        let udIsShowTutorial = UserDefaults.standard.bool(forKey: udIsShowTutorialKey)
        if udIsShowTutorial {
            helpButton.isHidden = false
        } else {
            helpButton.isHidden = true
        }
    }
    
    private func removeOnboardingFromNavigationHierarchy() {
        navigationController?.viewControllers.removeAll(where: { $0 is OnboardingViewController })
        navigationController?.viewControllers.removeAll(where: { $0 is InputNameViewController })
    }
    
    private func navigateToLevel(category: Category) {
        let udIsShowTutorial = UserDefaults.standard.bool(forKey: udIsShowTutorialKey)
        if udIsShowTutorial {
            let vc = StorytellingVC(category: category)
            self.present(vc, animated: true)
        } else {
            let vc = TutorialViewController()
            vc.category = category
            self.present(vc, animated: true)
        }
    }
    
    // MARK: - Actions
    @IBAction private func soundStateAction(_ sender: Any) {
        if service.isPlayingBackgroundMusic {
            service.stopBackgroundMusic()
            soundStateButton.setImage(UIImage(systemName: "speaker.wave.2.fill"), for: .normal)
        } else {
            service.playBackgroundMusic()
            soundStateButton.setImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
        }
    }
    
    @IBAction private func helpAction(_ sender: Any) {
        let vc = TutorialViewController()
        vc.category = Category.dataObject().first
        self.present(vc, animated: true)
    }
    
}

// MARK: - Table view delegate and data source
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LevelSectionCell.REUSE_IDENTIFIER) as! LevelSectionCell
        
        let title = indexPath.row == 0 ? "Finding the object" : "Have an adventure"
        let categories = indexPath.row == 0 ? Category.dataObject() : Category.dataObjectAdventure()
        
        cell.setupContents(title: title, categories: categories)
        cell.setupSelectHandler { [unowned self] category in
            if indexPath.row == 1 {
                let adventureModal = AdventureModalVC()
                adventureModal.setDismissHanlder { [unowned self] in
                    self.navigateToLevel(category: category)
                }
                self.present(adventureModal, animated: true)
            } else {
                self.navigateToLevel(category: category)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        LevelSectionCell.CELL_HEIGHT
    }
}
