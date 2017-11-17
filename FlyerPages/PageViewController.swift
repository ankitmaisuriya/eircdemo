//
//  PageViewController.swift
//  FlyerPages
//
//  Created by Ankit Maisuriya on 2017-11-17.
//  Copyright © 2017 Ankit Maisuriya. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var flyers: [Flyer]!
    
    var flyerViewControllers = [FlyerViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<flyers.count  {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let flyerVC = storyboard.instantiateViewController(withIdentifier: "flyerViewController") as! FlyerViewController
            flyerVC.flyerData = (flyers[i], i)
            flyerViewControllers.append(flyerVC)
        }
        
        let startVC = flyerViewControllers.first!
        
        self.dataSource = self
        
        setViewControllers([startVC], direction: .forward, animated: true, completion: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}


// MARK: page view data source
extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let flyerVC = viewController as! FlyerViewController
        switch flyerVC.flyerData.1 {
        case 0:
            return nil
        default:
            return flyerViewControllers[flyerVC.flyerData.1 - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let flyerVC = viewController as! FlyerViewController
        switch flyerVC.flyerData.1 {
        case flyerViewControllers.count - 1:
            return nil
        default:
            return flyerViewControllers[flyerVC.flyerData.1 + 1]
        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return flyerViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        let currentVC = pageViewController.viewControllers?.first! as! FlyerViewController
        
        return flyerViewControllers.index(of: currentVC)!
    }
}

