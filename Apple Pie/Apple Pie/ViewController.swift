//
//  ViewController.swift
//  Apple Pie
//
//  Created by Jeewoo Chung on 8/21/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class ViewController: VCLLoggingViewController {
    
    var listOfWords: [String] = ["mango", "soccer", "bank", "football", "hockey", "bicycle", "pineapple", "sugar", "sushi", "pencil", "calculator", "math", "lamp", "hoodie", "jacket", "mouse", "rabbit", "horse", "guitar", "pinao", "trumpet"]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    var currentGame: Game!

    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.remove(at: 0)
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
            correctWordLabel.text = "GAME OVER"
            // update UI
            scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
            treeImageView.image = UIImage(named: "gameover")
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        correctWordLabel.text = letters.joined(separator: " ")
        
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.formattedWord == currentGame.word {
            totalWins += 1
        } else {
            updateUI()
        }
    }


}

