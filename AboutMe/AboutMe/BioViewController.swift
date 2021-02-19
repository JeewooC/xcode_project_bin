//
//  ViewController.swift
//  AboutMe
//
//  Created by Jeewoo Chung on 7/16/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class BioViewController: UIViewController {
    func label() -> UILabel {
        let main = UILabel()
        main.translatesAutoresizingMaskIntoConstraints = false
        return main
    }
    
    func stackView(arr: [UIView]) -> UIStackView {
        let main = UIStackView(arrangedSubviews: arr)
        main.translatesAutoresizingMaskIntoConstraints = false
        return main
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .darkGray
        addViews()
    }
    
    func addViews() {
        let name = label()
        name.text = "Name: Jeewoo Chung"
        name.font = UIFont(name: "Marker Felt", size: 25)
        
        let age = label()
        age.text = "Age: 15"
        age.font = UIFont(name: "Marker Felt", size: 25)
        
        let gender = label()
        gender.text = "Gender: male"
        gender.font = UIFont(name: "Marker Felt", size: 25)
        
        let stack = stackView(arr: [name, age, gender])
        stack.alignment = .leading
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 40
        
        view.addSubview(stack)
        NSLayoutConstraint.init(item: stack, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: stack, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20).isActive = true
    }

}

