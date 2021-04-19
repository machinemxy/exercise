//
//  Constants.swift
//  WeatherApp
//
//  Created by Mohammad Azam on 8/17/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

struct Constants {
    
    struct URLs {
        
        static func weather(city: String) -> String {
            return "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=4b081756169f0706049995b05e78c827&units=metric"
        }
        
        // celsius = metric
        // 华氏 = imperial
    }
    
}
