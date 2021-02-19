//
//  ViewController.swift
//  Calculator
//
//  Created by Jeewoo Chung on 8/20/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var display: UILabel!
    var equation = ""
    
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        equation += String(sender.tag)
        updateUI()
    }
    
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        equation += " " + sender.titleLabel!.text! + " "
        updateUI()
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        equation = ""
        display.text = "0"
    }
    
    
    @IBAction func equalButtonPressed(_ sender: UIButton) {
        var equationArr: [String] = equation.split(separator: " ").map { String($0) }
        var numberArr = [Int]()
        var operatorArr = [String]()
        
        var index = 0
        
        while (index < equationArr.endIndex) {
            if let current = Int(equationArr[index]) {
                numberArr.append(current)
            } else {
                operatorArr.append(String(equationArr[index]))
            }
            index += 1
        }
        
        for n in 1...2 {
            var numberIndex = 1
            var operatorIndex = 0
            while (operatorIndex < operatorArr.count) {
                if n == 1 {
                    if operatorArr[operatorIndex] == "x" || operatorArr[operatorIndex] == "/" {
                        numberArr[numberIndex] = operations(operatorArr[operatorIndex], numberArr[numberIndex-1], numberArr[numberIndex])
                        numberArr.remove(at: numberIndex-1)
                        operatorArr.remove(at: operatorIndex)
                    } else {
                        numberIndex += 1
                        operatorIndex += 1
                    }
                } else {
                    numberArr[numberIndex] = operations(operatorArr[operatorIndex], numberArr[numberIndex-1], numberArr[numberIndex])
                    numberArr.remove(at: numberIndex-1)
                    operatorArr.remove(at: operatorIndex)
                }
            }
        }
        
        print(numberArr[0])
        equation = String(numberArr[0])
        updateUI()
        equation = ""
        
        
    }
    
    func operations(_ sign: String, _ total: Int, _ new: Int) -> Int {
        var result: Int
        if sign == "+" {
            result = total + new
        } else if sign == "-" {
            result = total - new
        } else if sign == "x" {
            result = total * new
        } else {
            result = total / new
        }
        
        return result
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        display.text = "0"
    }
    
    func updateUI() {
        display.text = equation
    }


}

