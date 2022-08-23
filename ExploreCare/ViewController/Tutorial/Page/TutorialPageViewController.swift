//
//  TutorialPageViewController.swift
//  ExploreCare
//
//  Created by Rasyid Ridla on 23/08/22.
//

import UIKit

protocol TutorialPageViewControllerDelegate: AnyObject {
    func setupPageController(numberOfPage: Int)
    func turnPageController(to index: Int)
}

class TutorialPageViewController: UIPageViewController {
    
    weak var pageViewControllerDelegate: TutorialPageViewControllerDelegate?
    var pageImage: [UIImage] = [UIImage(named: "bg_tutorial_content1")!, UIImage(named: "bg_tutorial_content2")! ]
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        dataSource = self
        delegate = self
        if let firstViewController = contentViewController(at: 0) {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension TutorialPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func turnPage(index: Int, type: Int) {
        currentIndex = index
        if let currentController = contentViewController(at: index) {
            switch type {
            case 1:
                setViewControllers([currentController], direction: .forward, animated: true)
            case 2:
                setViewControllers([currentController], direction: .reverse, animated: true)
            default:
                setViewControllers([currentController], direction: .forward, animated: true)
            }
            self.pageViewControllerDelegate?.turnPageController(to: currentIndex)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if var index = (viewController as? TutorialContentViewController)?.index {
            index -= 1
            return contentViewController(at: index)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if var index = (viewController as? TutorialContentViewController)?.index {
            index += 1
            return contentViewController(at: index)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        if let pageContentViewController = pageViewController.viewControllers?.first as? TutorialContentViewController {
            currentIndex = pageContentViewController.index
            self.pageViewControllerDelegate?.turnPageController(to: currentIndex)
        }
    }
    
    func contentViewController(at index: Int) -> TutorialContentViewController? {
        if index < 0 || index > 1 {
            return nil
        }
        
        let pageContentViewController = TutorialContentViewController(nibName: "TutorialContentViewController", bundle: nil)
        
        pageContentViewController.index = index
        pageContentViewController.image = pageImage[index]
        self.pageViewControllerDelegate?.setupPageController(numberOfPage: 2)
        
        return pageContentViewController
    }
}
