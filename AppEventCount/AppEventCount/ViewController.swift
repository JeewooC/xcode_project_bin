//
//  ViewController.swift
//  AppEventCount
//
//  Created by Jeewoo Chung on 9/10/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var didFinishLaunchingLabel: UILabel!
    @IBOutlet var willEnterForegroundLabel: UILabel!
    @IBOutlet var didBecomeActiveLabel: UILabel!
    @IBOutlet var willResignActiveLabel: UILabel!
    @IBOutlet var didEnterBackgroundLabel: UILabel!
    @IBOutlet var willTerminateLabel: UILabel!
    
    var launchCount = 0
    var foregroundCount = 0
    var activeCount = 0
    var resignCount = 0
    var backgroundCount = 0
    var terminateCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        didFinishLaunchingLabel.text = "The app has launched \(launchCount) time(s)"
        willEnterForegroundLabel.text = "The app has entered foreground \(foregroundCount) time(s)"
        didBecomeActiveLabel.text = "The app has become active \(activeCount) time(s)"
        willResignActiveLabel.text = "The app has resigned \(resignCount) time(s)"
        didEnterBackgroundLabel.text = "The app has entered background \(backgroundCount) time(s)"
        willTerminateLabel.text = "The app has terminated \(terminateCount) time(s)"
    }


}

