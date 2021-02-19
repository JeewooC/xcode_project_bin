//
//  ViewController.swift
//  MemeMaker
//
//  Created by Jeewoo Chung on 7/15/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var topCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet var bottomCaptionSegmentedControl: UISegmentedControl!
    @IBOutlet var topCaptionLabel: UILabel!
    @IBOutlet var bottomCaptionLabel: UILabel!
    @IBOutlet var image: UIImageView!
    
    let topChoices: [CaptionOption] = [CaptionOption(emoji: "🐕", caption: "What did the dog say?"), CaptionOption(emoji: "👶🏻", caption: "What did the baby say?"), CaptionOption(emoji: "👻", caption: "What did the ghost say?")]
    let bottomChoices: [CaptionOption] = [CaptionOption(emoji: "🐈", caption: "Meow"), CaptionOption(emoji: "🔬", caption: "E = mc²"), CaptionOption(emoji: "😈", caption: "Ah! You scared me!")]
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        configureCaption()
        configureImage()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topCaptionSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topCaptionSegmentedControl.selectedSegmentIndex = 0
        
        bottomCaptionSegmentedControl.removeAllSegments()
        for choice in bottomChoices {
            bottomCaptionSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomCaptionSegmentedControl.selectedSegmentIndex = 0
        
        configureCaption()
        configureImage()
    }
    
    func configureCaption() {
        let topIndex = topCaptionSegmentedControl.selectedSegmentIndex
        topCaptionLabel.text = topChoices[topIndex].caption
        let bottomIndex = bottomCaptionSegmentedControl.selectedSegmentIndex
        bottomCaptionLabel.text = bottomChoices[bottomIndex].caption
        
        setupLabels()
    }
    
    func configureImage() {
        let topIndex = topCaptionSegmentedControl.selectedSegmentIndex
        switch(topIndex) {
        case 0:
            image.image = UIImage(named: "goldie")
        case 1:
            image.image = UIImage(named: "baby")
        case 2:
            image.image = UIImage(named: "ghost")
        default:
            image.image = UIImage(named: "goldie")
        }
    }
    
    func setupLabels() {
        topCaptionLabel.font = UIFont(name: "System", size: 50)
        bottomCaptionLabel.font = UIFont(name: "System", size: 100)
    }


}

