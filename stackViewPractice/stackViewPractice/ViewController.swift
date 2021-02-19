//
//  ViewController.swift
//  stackViewPractice
//
//  Created by Jeewoo Chung on 7/9/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imageView11: UIImageView = {
        let main = UIImageView(image: UIImage(named: "Carbon"))
        main.translatesAutoresizingMaskIntoConstraints = false
        main.contentMode = .scaleAspectFit
        return main
    }()
    let imageView12: UIImageView = {
        let main = UIImageView(image: UIImage(named: "Carbon"))
        main.translatesAutoresizingMaskIntoConstraints = false
        main.contentMode = .scaleAspectFit
        return main
    }()
    let imageView13: UIImageView = {
        let main = UIImageView(image: UIImage(named: "Carbon"))
        main.translatesAutoresizingMaskIntoConstraints = false
        main.contentMode = .scaleAspectFit
        return main
    }()
    let imageView21: UIImageView = {
        let main = UIImageView(image: UIImage(named: "Carbon"))
        main.translatesAutoresizingMaskIntoConstraints = false
        main.contentMode = .scaleAspectFit
        return main
    }()
    let imageView22: UIImageView = {
        let main = UIImageView(image: UIImage(named: "Carbon"))
        main.translatesAutoresizingMaskIntoConstraints = false
        main.contentMode = .scaleAspectFit
        return main
    }()
    let imageView23: UIImageView = {
        let main = UIImageView(image: UIImage(named: "Carbon"))
        main.translatesAutoresizingMaskIntoConstraints = false
        main.contentMode = .scaleAspectFit
        return main
    }()
    let imageView31: UIImageView = {
        let main = UIImageView(image: UIImage(named: "Carbon"))
        main.translatesAutoresizingMaskIntoConstraints = false
        main.contentMode = .scaleAspectFit
        return main
    }()
    let imageView32: UIImageView = {
        let main = UIImageView(image: UIImage(named: "Carbon"))
        main.translatesAutoresizingMaskIntoConstraints = false
        main.contentMode = .scaleAspectFit
        return main
    }()
    let imageView33: UIImageView = {
        let main = UIImageView(image: UIImage(named: "Carbon"))
        main.translatesAutoresizingMaskIntoConstraints = false
        main.contentMode = .scaleAspectFit
        return main
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(imageView11)
        view.addSubview(imageView12)
        view.addSubview(imageView13)
        let stackView1 = UIStackView(arrangedSubviews: [
            imageView11, imageView12, imageView13
            ])
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.axis = .horizontal
        stackView1.alignment = .center
        stackView1.spacing = 10
        stackView1.distribution = .fillEqually
        view.addSubview(stackView1)
        
        view.addSubview(imageView21)
        view.addSubview(imageView22)
        view.addSubview(imageView23)
        let stackView2 = UIStackView(arrangedSubviews: [
            imageView21, imageView22, imageView23
            ])
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.axis = .horizontal
        stackView2.alignment = .center
        stackView2.spacing = 10
        stackView2.distribution = .fillEqually
        view.addSubview(stackView2)
        
        view.addSubview(imageView31)
        view.addSubview(imageView32)
        view.addSubview(imageView33)
        let stackView3 = UIStackView(arrangedSubviews: [
            imageView31, imageView32, imageView33
            ])
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        stackView3.axis = .horizontal
        stackView3.alignment = .center
        stackView3.spacing = 10
        stackView3.distribution = .fillEqually
        view.addSubview(stackView3)
        
        let masterStackView = UIStackView(arrangedSubviews: [
            stackView1, stackView2, stackView3
            ])
        
        masterStackView.translatesAutoresizingMaskIntoConstraints = false
        
        masterStackView.axis = .vertical
        masterStackView.alignment = .center
        masterStackView.spacing = 10
        masterStackView.distribution = .fillEqually
        
        view.addSubview(masterStackView)
        
        NSLayoutConstraint(item: masterStackView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: masterStackView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: masterStackView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.8, constant: 0).isActive = true
        NSLayoutConstraint(item: masterStackView, attribute: .height, relatedBy: .equal, toItem: masterStackView, attribute: .width, multiplier: 1, constant: 0).isActive = true
        
    }


}

