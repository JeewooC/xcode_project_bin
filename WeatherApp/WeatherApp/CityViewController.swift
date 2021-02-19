//
//  ViewController.swift
//  WeatherApp
//
//  Created by Derrick Park on 2019-06-22.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
    var city: City?  {
        didSet {
            label.text = city?.cityName
        }
    }
    
    let label: UILabel = {
        let main = UILabel()
        main.font = UIFont.boldSystemFont(ofSize: 50)
        main.textAlignment = .center
        main.textColor = .black
        main.translatesAutoresizingMaskIntoConstraints = false
        return main
    }()
    
    let detailButton: UIButton = {
       let main = UIButton()
        main.setTitle("Go See Details...", for: .normal)
        main.backgroundColor = .black
        main.tintColor = .white
        main.layer.cornerRadius = 16
        main.widthAnchor.constraint(equalToConstant: 220).isActive = true
        main.heightAnchor.constraint(equalToConstant: 50).isActive = true
        main.translatesAutoresizingMaskIntoConstraints = false
        return main
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationItem.title = city?.countryName
        
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        label.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        view.addSubview(detailButton)
        detailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        detailButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        detailButton.addTarget(self, action: #selector(showWeatherDetails), for: .touchUpInside)
        
    }
    
    @objc func showWeatherDetails() {
        let detailVC = DetailsViewController()
        detailVC.city = city
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}

