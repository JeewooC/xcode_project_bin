//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Jeewoo Chung on 8/27/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses: [Answer]!
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responsesType = responses.map { $0.type }
        
        for response in responsesType {
            let newCount: Int
            if let oldCount = frequencyOfAnswers[response] {
                newCount = oldCount+1
            } else {
                newCount = 1
            }
            
            frequencyOfAnswers[response] = newCount
        }
        
        let sortedFrequency = frequencyOfAnswers.sorted(by: {
            (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = sortedFrequency.first?.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer!.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer?.definition
    }

}
