//
//  FlyerViewController.swift
//  FlyerPages
//
//  Created by Ankit Maisuriya on 2017-11-17.
//  Copyright © 2017 Ankit Maisuriya. All rights reserved.
//

import UIKit

class FlyerViewController: UIViewController {

    
    @IBOutlet weak var flyerImage: UIImageView!
    @IBOutlet weak var loadingAnimation: UIActivityIndicatorView!
    
    var imageView: UIImageView!
    
    var flyerData: (Flyer, Int)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadingAnimation.startAnimating()
        
        downloadImage(url: flyerData.0.url) { [weak self] (image) in
            
            self?.loadingAnimation.stopAnimating()
            self?.loadingAnimation.isHidden = true
            
            if let image = image {
                self?.flyerImage.image = image
            }
            else {
                let frame = CGRect(x: 0, y: 0, width: 200, height: 100)
                let label = UILabel(frame: frame)
                label.center = (self?.flyerImage.center)!
                label.text = self?.flyerData.0.url
                self?.flyerImage.addSubview(label)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: loading image
extension FlyerViewController {
    
    func downloadImage(url: String, completion: (_ image: UIImage?)-> Void) {
        
        completion(nil)
    }
}
