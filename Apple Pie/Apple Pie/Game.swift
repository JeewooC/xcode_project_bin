//
//  Game.swift
//  Apple Pie
//
//  Created by Jeewoo Chung on 8/22/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    var formattedWord: String {
        get {
            var guessedWord = ""
            for letter in word {
                if guessedLetters.contains(letter) {
                    guessedWord += String(letter)
                } else {
                    guessedWord += "_"
                }
            }
            return guessedWord
        }
    }
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}
