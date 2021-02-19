//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Jeewoo Chung on 9/3/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import Foundation

enum ResponseType {
    case single, multiple, ranged
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", lion = "🦁", cow = "🐮"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are a dog. You are a dog. You are a dog. You are a dog. You are a dog. You are a dog. You are a dog. You are a dog. You are a dog."
        case .cat:
            return "You are a cat. You are a cat. You are a cat. You are a cat. You are a cat. You are a cat. You are a cat. You are a cat. You are a cat."
        case .lion:
            return "You are a lion. You are a lion. You are a lion. You are a lion. You are a lion. You are a lion. You are a lion. You are a lion. You are a lion."
        case .cow:
            return "You are a cow. You are a cow. You are a cow. You are a cow. You are a cow. You are a cow. You are a cow. You are a cow. You are a cow."
        }
    }
}

struct Answer {
    var text: String
    var type: AnimalType
}

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}
