//
//  ViewController.swift
//  RPS
//
//  Created by Derrick Park on 2019-04-23.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var appSign: UILabel!
  @IBOutlet var gameStatus: UILabel!
  @IBOutlet var rockButton: UIButton!
  @IBOutlet var paperButton: UIButton!
  @IBOutlet var scissorsButton: UIButton!
  @IBOutlet var playAgainButton: UIButton!
  
  private var state: GameState = .Start
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }
  
  fileprivate func setStateUI(label: String, background: UIColor, buttonsEnabled: Bool) {
    gameStatus.text = label
    view.backgroundColor = background
    playAgainButton.isHidden = buttonsEnabled
    rockButton.isEnabled = buttonsEnabled
    paperButton.isEnabled = buttonsEnabled
    scissorsButton.isEnabled = buttonsEnabled
  }
  
  fileprivate func updateUI() {
    switch state {
    case .Start:
      appSign.text = "🤖"
      setStateUI(label: "Rock, Paper, Scissors?", background: .white, buttonsEnabled: true)
      
    case .Win:
      setStateUI(label: "You won!", background: .blue, buttonsEnabled: false)
      
    case .Draw:
      setStateUI(label: "Draw!", background: .yellow, buttonsEnabled: false)
      
    case .Lose:
      setStateUI(label: "You lost!", background: .red, buttonsEnabled: false)
    }
  }
  
  @IBAction func play(_ sender: UIButton) {
    // 1. get the random computer sign
    let compSign = randomSign()
    appSign.text = compSign.emoji
    // 2. which button is tapped?
    if sender.tag == 1 {
      state = (Sign.Rock).getGameState(other: compSign)
    } else if sender.tag == 2 {
      state = (Sign.Paper).getGameState(other: compSign)
    } else if sender.tag == 3 {
      state = (Sign.Scissors).getGameState(other: compSign)
    }
    updateUI()
  }
  
  @IBAction func playAgain(_ sender: UIButton) {
    state = .Start
    updateUI()
  }
  
}

