//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Jeewoo Chung on 8/27/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multiLabel1: UILabel!
    @IBOutlet var multiLabel2: UILabel!
    @IBOutlet var multiLabel3: UILabel!
    @IBOutlet var multiLabel4: UILabel!
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet var multiSwitch4: UISwitch!
    
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    @IBOutlet var rangedSlider: UISlider!
    
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    
    var questionIndex = 0
    var answersChosen: [Answer] = []
    
    let questions: [Question] = [
        Question(text: "Which food do you like the most?", type: .single,
                 answers: [
                    Answer(text: "Bones", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Steak", type: .lion),
                    Answer(text: "Bread", type: .cow)
                ]),
        Question(text: "Which of these activities do you enjoy?", type: .multiple,
                 answers: [
                    Answer(text: "Going out", type: .dog),
                    Answer(text: "Reading a book", type: .cat),
                    Answer(text: "Watching Netflix", type: .cow),
                    Answer(text: "Hunting", type: .lion)
                ]),
        Question(text: "How much do you like swimming?", type: .ranged,
                 answers: [
                    Answer(text: "I hate it", type: .cat),
                    Answer(text: "I don't mind it", type: .cow),
                    Answer(text: "I enjoy it", type: .lion),
                    Answer(text: "I love it", type: .dog)
                ])
    
    ]
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count-1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(Float(questionIndex)/Float(questions.count), animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }

    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsVC = segue.destination as! ResultsViewController
            resultsVC.responses = answersChosen
        }
    }
}
