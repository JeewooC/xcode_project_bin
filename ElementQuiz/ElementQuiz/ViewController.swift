//
//  ViewController.swift
//  ElementQuiz
//
//  Created by Jeewoo Chung on 7/5/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var answerLabel: UILabel!
    
  
    let elementList = ["Carbon", "Gold", "Chlorine", "Sodium", "Hydrogen", "Iodine", "Iron", "Mercury", "Oxygen"]
    var used = [String]()
    var currentElementIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentElementIndex = randomIndex()
        updateElement()
    }
    
    func randomIndex() -> Int{
        if (used.count >= elementList.count) {
            used.removeAll()
        }
        
        var index = Int.random(in: 0 ..< elementList.count)
        var elementName = elementList[index]
        
        while (used.contains(elementName)) {
            index = Int.random(in: 0 ..< elementList.count)
            elementName = elementList[index]
        }
        
        used.append(elementName)
        return index
    }
    
    func updateElement() {
        answerLabel.text = "?"
        let elementName = elementList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageView.image = image
    }

    @IBAction func gotoNextElement(_ sender: UIButton) {
        currentElementIndex = randomIndex()
        updateElement()
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        answerLabel.text = elementList[currentElementIndex]
    }
}

