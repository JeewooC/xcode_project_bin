//
//  DetailsViewController.swift
//  WeatherApp
//
//  Created by Jeewoo Chung on 7/22/19.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var city: City? {
        didSet {
            countryLabel.text = city?.countryEmoji
            cityLabel.text = city?.cityName
            tempLabel.text = String(format: "%.1f", city!.temp)
            summaryLabel.text = city?.summary
        }
    }
    
    var countryLabel: UILabel = {
        let main = UILabel()
        main.translatesAutoresizingMaskIntoConstraints = false
        main.font = .systemFont(ofSize: 50)
        return main
    }()
    
    var cityLabel: UILabel = {
       let main = UILabel()
        main.translatesAutoresizingMaskIntoConstraints = false
        main.font = .italicSystemFont(ofSize: 50)
        main.textColor = .darkGray
        return main
    }()
    
    var tempLabel: UILabel = {
        let main = UILabel()
        main.translatesAutoresizingMaskIntoConstraints = false
        main.font = .italicSystemFont(ofSize: 50)
        main.textColor = .darkGray
        return main
    }()
    
    var summaryLabel: UILabel = {
        let main = UILabel()
        main.translatesAutoresizingMaskIntoConstraints = false
        main.font = .italicSystemFont(ofSize: 50)
        main.textColor = .darkGray
        return main
    }()
    
    var filler: UILabel = {
        let main = UILabel()
        main.translatesAutoresizingMaskIntoConstraints = false
        main.text = " "
        return main
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let country = createStaticLabel(title: "Country")
        let city = createStaticLabel(title: "City")
        let temperature = createStaticLabel(title: "Temperature")
        let summary = createStaticLabel(title: "Summary")
        
        let arr: [UILabel] = [country, countryLabel, city, cityLabel, temperature, tempLabel, summary, summaryLabel]
        
        for label in arr {
            view.addSubview(label)
            labelConstraints(label: label)
        }
        
        var stackArr = [UIStackView]()
        
        for x in 0...7 where x % 2 == 0 {
            let sv = createSubStacks(labels: [arr[x], arr[x+1]])
            
            stackArr.append( sv )
            
        }
        
        let stackView = UIStackView(arrangedSubviews: stackArr)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 45

        view.addSubview(stackView)

        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func createStaticLabel(title: String) -> UILabel {
        let main = UILabel()
        main.text = title
        main.font = .boldSystemFont(ofSize: 20)
        main.textColor = .black
        return main
    }
    
    func labelConstraints(label: UILabel) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50)
    }
    
    func createSubStacks(labels: [UILabel]) -> UIStackView {
        let main = UIStackView()
        main.addArrangedSubview(labels[0])
        main.addArrangedSubview(labels[1])
        
        main.translatesAutoresizingMaskIntoConstraints = false
        main.axis = .vertical
        main.alignment = .center
        main.distribution = .equalSpacing
        main.spacing = 2
        
        view.addSubview(main)
        
        main.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        main.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return main
    }
    
}
