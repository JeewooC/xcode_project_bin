//
//  ViewController.swift
//  StoryNavigation
//
//  Created by Jeewoo Chung on 6/25/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Restart", style: .plain, target: self, action: #selector(restart))
        
    }
    
    @objc func restart() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}

