//
//  ViewController.swift
//  RPS
//
//  Created by Jeewoo Chung on 7/9/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gameState: GameState = .start
    
    @IBOutlet var appSign: UILabel!
    @IBOutlet var gameStatus: UILabel!
    @IBOutlet var playerSignRock: UIButton!
    @IBOutlet var playerSignPaper: UIButton!
    @IBOutlet var playerSignScissors: UIButton!
    @IBOutlet var playAgain: UIButton!
    
    @IBAction func play(_ sender: UIButton) {
        let appPlay = randomSign()
        switch (appPlay) {
        case .rock:
            appSign.text = "👊"
        case .paper:
            appSign.text = "✋"
        case .scissors:
            appSign.text = "✌️"
        }
        
        if (sender.tag == 1) {
            playerSignRock.isHidden = false
            playerSignPaper.isHidden = true
            playerSignScissors.isHidden = true
            gameState = Sign.rock.compare(opp: appPlay)
        } else if (sender.tag == 2) {
            playerSignRock.isHidden = true
            playerSignPaper.isHidden = false
            playerSignScissors.isHidden = true
            gameState = Sign.paper.compare(opp: appPlay)
        } else if (sender.tag == 3) {
            playerSignRock.isHidden = true
            playerSignPaper.isHidden = true
            playerSignScissors.isHidden = false
            gameState = Sign.scissors.compare(opp: appPlay)
        }
        
        updateUI()
    }
    
    @IBAction func playAgain(_ sender: Any) {
        gameState = .start
        updateUI()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    func updateHelper(bgColor: UIColor, gameStatusText: String, againButton: Bool) {
        view.backgroundColor = bgColor
        gameStatus.text = gameStatusText
        playAgain.isHidden = againButton
    }
    
    func updateUI() {
        switch (gameState) {
        case .start:
            updateHelper(bgColor: .lightGray, gameStatusText: "Rock, Paper, Scissors?", againButton: true)
            playerSignRock.isHidden = false
            playerSignPaper.isHidden = false
            playerSignScissors.isHidden = false
        case .lose:
            updateHelper(bgColor: .red, gameStatusText: "You lose!", againButton: false)
        case .draw:
            updateHelper(bgColor: .yellow, gameStatusText: "Draw!", againButton: false)
        case .win:
            updateHelper(bgColor: .green, gameStatusText: "You win!", againButton: false)
        }
    }

}

