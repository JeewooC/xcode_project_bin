//
//  City.swift
//  WeatherApp
//
//  Created by Jeewoo Chung on 7/22/19.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

class City {
    var countryName: String
    var countryEmoji: String
    var cityName: String
    var temp: Double
    var summary: String
    
    init(countryName: String, countryEmoji: String, cityName: String, temp: Double, summary: String) {
        self.countryName = countryName
        self.countryEmoji = countryEmoji
        self.cityName = cityName
        self.temp = temp
        self.summary = summary
    }
}
