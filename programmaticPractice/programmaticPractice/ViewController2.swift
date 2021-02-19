//
//  ViewController2.swift
//  programmaticPractice
//
//  Created by Jeewoo Chung on 7/16/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    var someText: UILabel = {
       let main = UILabel()
        main.text = "HISTORY"
        main.font = UIFont(name: "System", size: 50.0)
        main.textColor = UIColor.white
        main.translatesAutoresizingMaskIntoConstraints = false
        return main
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .lightGray
        view.addSubview(someText)
        
        configureConstraints()
    }
    
    func configureConstraints() {
        NSLayoutConstraint.init(item: someText, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: someText, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        someText.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
