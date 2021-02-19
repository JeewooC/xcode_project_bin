//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Jeewoo Chung on 8/27/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet var middleLabel: UILabel!
    var eventNumber: Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        if let existingText = middleLabel.text {
            middleLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewDidLoad"
            eventNumber += 1
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let existingText = middleLabel.text {
            middleLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewWillAppear"
            eventNumber += 1
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let existingText = middleLabel.text {
            middleLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewDidAppear"
            eventNumber += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let existingText = middleLabel.text {
            middleLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewWillDisappear"
            eventNumber += 1
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let existingText = middleLabel.text {
            middleLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewDidDisappear"
            eventNumber += 1
        }
    }

}
