//
//  OnboardingViewController.swift
//  ExploreCare
//
//  Created by Rahmat Rizky on 23/08/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
    didSet {
        if currentPage == slides.count - 1 {
            startBtn.setTitle(("Start"), for: .normal)
            startBtn.isHidden = false
        } else {
            startBtn.isHidden = true
        }
    }
}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageControl.numberOfPages = 2
        
        slides = [
            OnboardingSlide(title: "Learn Vocabulary", description: "Fun way to learn vocabulary", bg: UIImage(named: "Background1")!, illu: UIImage(named: "Illu1")!, leftChar: UIImage(named: "Char1Kiri")! , rightChar: UIImage(named: "Char1Kanan")!),
            OnboardingSlide(title: "Explore Surroundings", description: "Get to know your surroundings while learning", bg: UIImage(named: "Background2")!, illu: UIImage(named: "Illu2")!, leftChar: UIImage(named: "Char2Kiri")! , rightChar: UIImage(named: "Char2Kanan")!)
        ]
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        currentPage = 0
        
    }
    
    @IBAction func startBtnClicked(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: udIsShowOnBoardKey)
        let vc = UIStoryboard(name: "InputName", bundle: nil).instantiateViewController(withIdentifier: "InputNameViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if slides.count < 0 || slides.count > 1 {
//            return nil
//        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
    
}
