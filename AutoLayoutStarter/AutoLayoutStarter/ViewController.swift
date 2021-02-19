//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let redView: UIView = {
        let main = UIView()
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .red
        main.heightAnchor.constraint(equalToConstant: 60).isActive = true
        main.widthAnchor.constraint(equalToConstant: 230).isActive = true
        return main
    }()
    
    func orangeView(frame: CGRect) -> UIView {
        let main = UIView(frame: frame)
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .orange
        return main
    }
    
    func blueView() -> UIView {
        let main = UIView()
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .blue
        
//        main.layer.borderWidth = 2
//        main.layer.borderColor =
        
        main.widthAnchor.constraint(equalToConstant: 60).isActive = true
        main.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return main
    }
    
    func emptyView() -> UIView {
       let main = UIView()
        main.translatesAutoresizingMaskIntoConstraints = false
        return main
    }
    
//    func stackView() -> UIStackView {
//        let b1 = blueView(size: 60)
//        let b2 = blueView(size: 60)
//        let b3 = blueView(size: 60)
//
//        let main = UIStackView(arrangedSubviews: [b1, b2, b3])
//
//        main.translatesAutoresizingMaskIntoConstraints = false
//        main.axis = .vertical
//        main.distribution = .equalSpacing
//        main.spacing = 20
//
//        main.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
//        main.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
//
//        return main
//    }
    
    // immediately invoked function (IIF)
    let purpleView: UIView = {
        let main = UIView()
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .purple
        return main
    }()
    
    let mainView: UIView = {
        let main = UIView()
        // important when setting contraints programmatically
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .green
        return main
    }()
    
    let squareButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Square", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
        return butt
    }()
    
    let portraitButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Portrait", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
        return butt
    }()
    
    let landScapeButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Landscape", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
        return butt
    }()
    
    var widthAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        mainView.addSubview(purpleView)
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        
        // purple
        purpleView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -30).isActive = true
        purpleView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -30).isActive = true
        purpleView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.65).isActive = true
        purpleView.heightAnchor.constraint(equalToConstant: 57).isActive = true
        
        // blue
        let b1 = blueView()
        let b2 = blueView()
        let b3 = blueView()
        
        let v1 = emptyView()
        let v2 = emptyView()
        
        let blueStackView = UIStackView(arrangedSubviews: [v1, b1, b2, b3, v2])
        blueStackView.translatesAutoresizingMaskIntoConstraints = false
        blueStackView.axis = .vertical
        blueStackView.distribution = .equalSpacing
        
        mainView.addSubview(blueStackView)
        
        blueStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        blueStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        
        blueStackView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        blueStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        
        // orange & red
        let o1 = orangeView(frame: CGRect(x: 10, y: 10, width: 110, height: 40))
        let o2 = orangeView(frame: CGRect(x: 130, y: 10, width: 90, height: 40))
        
        mainView.addSubview(redView)
        
        redView.addSubview(o1)
        redView.addSubview(o2)
        
        redView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 30).isActive = true
        redView.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -30).isActive = true
        
        
        
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
        widthAnchor?.isActive = true
        
        heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
        heightAnchor?.isActive = true
        
        let buttStackView = UIStackView(arrangedSubviews: [
            squareButton, portraitButton, landScapeButton])
        buttStackView.translatesAutoresizingMaskIntoConstraints = false
        buttStackView.axis = .horizontal
        buttStackView.alignment = .center
        buttStackView.distribution = .fillEqually
        
        view.addSubview(buttStackView)
        NSLayoutConstraint.activate([
            buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttStackView.heightAnchor.constraint(equalToConstant: 50),
            buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
    }
    
    @objc private func squareTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func portraitTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc private func landscapeTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
}

