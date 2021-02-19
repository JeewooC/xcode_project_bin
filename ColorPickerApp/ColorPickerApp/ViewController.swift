//
//  ViewController.swift
//  ColorPickerApp
//
//  Created by Jeewoo Chung on 7/2/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSwitch: UISwitch!
    @IBOutlet var greenSwitch: UISwitch!
    @IBOutlet var blueSwitch: UISwitch!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    func updateColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
        }
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
        }
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }
    
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    
    @IBAction func reset(_ sender: AnyObject) {
        redSlider.value = 1
        greenSlider.value = 1
        blueSlider.value = 1
        
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
        updateControls()
        updateColor()
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateColor()
        updateControls()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        colorView.layer.borderWidth = 4
        colorView.layer.cornerRadius = 10
        colorView.layer.borderColor = UIColor.black.cgColor
        updateControls()
        updateColor()
    }


}

