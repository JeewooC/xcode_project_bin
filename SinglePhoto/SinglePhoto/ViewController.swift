//
//  ViewController.swift
//  SinglePhoto
//
//  Created by Jeewoo Chung on 6/4/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Life cycles
    let photoImageView: UIImageView = {
        let iv = UIImageView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        iv.image = UIImage(named: "paris")
        iv.contentMode = .scaleToFill
        return iv
    }()
    // 1. ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        // initial settings
        view.addSubview(photoImageView)
    }
}

