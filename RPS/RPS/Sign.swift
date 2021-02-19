//
//  Sign.swift
//  RPS
//
//  Created by Jeewoo Chung on 7/9/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock
    case scissors
    case paper
        
    func compare(opp: Sign) -> GameState {
        switch (self, opp) {
        case (.rock, .rock):
            return .draw
        case (.rock, .paper):
            return .lose
        case (.rock, .scissors):
            return .win
        case (.paper, .rock):
            return .win
        case(.paper, .paper):
            return .draw
        case(.paper, .scissors):
            return .lose
        case(.scissors, .rock):
            return .lose
        case(.scissors, .paper):
            return .win
        case(.scissors, .scissors):
            return .draw
            
        }
        
    }
}
