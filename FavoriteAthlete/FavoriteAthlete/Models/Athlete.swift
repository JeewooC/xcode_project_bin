//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Jeewoo Chung on 9/10/19.
//

import Foundation

struct Athlete {
    var name: String
    var age: Int
    var discipline: String
    var team: String
    var nationality: String
    
    var description: String {
        return "\(name) is \(age) years old \(discipline) athlete from \(nationality) and plays for the \(team)."
    }
}
