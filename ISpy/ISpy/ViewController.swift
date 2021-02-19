//
//  ViewController.swift
//  ISpy
//
//  Created by Jeewoo Chung on 9/15/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.delegate = self
        
    }
    
    func updateZoomFor(size: CGRect) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scale
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateZoomFor(size: view.bounds)
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    

}

