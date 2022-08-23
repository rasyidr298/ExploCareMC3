//
//  TutorialViewController.swift
//  ExploreCare
//
//  Created by Rasyid Ridla on 23/08/22.
//

import UIKit

class TutorialViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var previousButton: UIButton!
    var tutorialPageViewController: TutorialPageViewController?
    var currentIndex = 0
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageView()
    }
    
    private func setupPageView() {
        tutorialPageViewController = TutorialPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        tutorialPageViewController?.pageViewControllerDelegate = self
        
        containerView.addSubview((tutorialPageViewController?.view)!)
        tutorialPageViewController?.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tutorialPageViewController!.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tutorialPageViewController!.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            tutorialPageViewController!.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            tutorialPageViewController!.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        tutorialPageViewController?.didMove(toParent: self)
        previousButton.isHidden = true
    }
    
    @IBAction func previousButton(_ sender: Any) {
        tutorialPageViewController?.turnPage(index: currentIndex-1, type: 2)
        previousButton.isHidden = true
    }
    @IBAction func nextButton(_ sender: Any) {
        if currentIndex < 1 {
            tutorialPageViewController?.turnPage(index: currentIndex+1, type: 1)
            previousButton.isHidden = false
        }else {
            toObjectRecogVC()
            UserDefaults.standard.set(true, forKey: udIsShowTutorialKey)
        }
    }
    @IBAction func skipButton(_ sender: Any) {
        toObjectRecogVC()
        UserDefaults.standard.set(true, forKey: udIsShowTutorialKey)
    }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func toObjectRecogVC() {
        dismiss(animated: true)
        
        let vc = ObjectRecogViewController()
        vc.isTutorial = true
        vc.category = category
        (presentingViewController as? UINavigationController)?.pushViewController(vc, animated: true)
    }
}

extension TutorialViewController:TutorialPageViewControllerDelegate {
    func setupPageController(numberOfPage: Int) {}
    
    func turnPageController(to index: Int) {
        currentIndex = index
        if index == 0 {
            previousButton.isHidden = true
        }
    }
}
