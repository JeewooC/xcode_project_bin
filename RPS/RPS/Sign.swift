//
//  Sign.swift
//  RPS
//
//  Created by Derrick Park on 2019-04-23.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
  let sign = randomChoice.nextInt()
  if sign == 0 {
    return .Rock
  } else if sign == 1 {
    return .Paper
  } else {
    return .Scissors
  }
}

enum Sign {
  case Rock
  case Paper
  case Scissors
  
  var emoji: String {
    switch self {
    case .Rock:
      return "👊"
    case .Paper:
      return "🖐"
    case .Scissors:
      return "✌️"
    }
  }
  
  func getGameState(other: Sign?) -> GameState {
    guard let other = other else { return .Start }
    switch (self, other) {
    case (.Rock, .Paper):
      return .Lose
    case (.Rock, .Rock):
      return .Draw
    case (.Rock, .Scissors):
      return .Win
    case (.Paper, .Rock):
      return .Win
    case (.Paper, .Paper):
      return .Draw
    case (.Paper, .Scissors):
      return .Lose
    case (.Scissors, .Rock):
      return .Lose
    case (.Scissors, .Paper):
      return .Win
    case (.Scissors, .Scissors):
      return .Draw
    }
  }
}
