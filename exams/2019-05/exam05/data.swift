//
//  data.swift
//  exam05
//
//  Created by d0m on 21/01/2020.
//  Copyright © 2020 d0m. All rights reserved.
//

import Foundation

class Weather {
    let city: String
    let country: String
    var temperature: Double
    init(city: String, country: String, temperature: Double) {
        self.city = city
        self.country = country
        self.temperature = temperature
    }
    func updateTemperature () {
        temperature += Double.random(in: -1.0 ... 1.0)
    }
}



