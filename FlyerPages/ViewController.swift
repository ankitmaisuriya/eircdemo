//
//  ViewController.swift
//  FlyerPages
//
//  Created by Ankit Maisuriya on 2017-11-17.
//  Copyright © 2017 Ankit Maisuriya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flyerArea: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fetchJSON { [unowned self] (urls) in
        
            var flyers = [Flyer]()
        
        //let urls = ["url1", "url2", "url3", "url4"]
            for url in urls {
                
                let flyer = Flyer(url: url)
                flyers.append(flyer)
            }
            
            let pageViewController = PageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
            
            pageViewController.flyers = flyers
            
            self.addChildViewController(pageViewController)
            pageViewController.view.frame = self.flyerArea.bounds
            self.flyerArea.addSubview(pageViewController.view)
            pageViewController.didMove(toParentViewController: self)
            
       }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func fetchJSON(completion: @escaping (_ urls: [String]) -> Void ) {
        let url = URL(string: "http://www.wincoredata.com/PHP/list_of_banner.php")

        let request = URLRequest(url: url!)
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { (data, response, error) in
        
            completion(["url1", "url2", "url3", "url4"])
            let httpRespond = response as! HTTPURLResponse
            print(httpRespond)
            
        }
            
    }
}

