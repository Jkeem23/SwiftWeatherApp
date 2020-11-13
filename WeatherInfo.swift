//
//  WeatherInfo.swift
//  InClass08
//
//  Created by Reginald Smith on 3/22/19.
//  Copyright © 2019 Smith, Reginald. All rights reserved.
//

import Foundation

class WeatherInfo { //main
    var temp:String?
    var tempMax:String?
    var tempMin:String?
    var humidity:String?
    
    init(json:[String:Any]){
        self.temp = "\(json["temp"]!)"
        self.tempMax = "\(json["temp_max"]!)"
        self.tempMin = "\(json["temp_min"]!)"
        self.humidity = "\(json["humidity"]!)"
    }
}

class Weather {
    var desc:String?
    
    init(json:[String:Any]){
        self.desc = json["description"] as! String
    }
}

class Wind {
    var speed:String?
    var degree:String?
    
    init(json:[String:Any]){
        self.speed = "\(json["speed"]!)"
        self.degree = "\(json["deg"]!)"
    }
}

class Clouds {
    var cloudiness:String?
    
    init(json:[String:Any]){
        self.cloudiness = "\(json["all"]!)"
    }
}
