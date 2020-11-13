//
//  CurrentWeatherViewController.swift
//  InClass08
//
//  Created by Smith, Reginald on 3/20/19.
//  Copyright © 2019 Smith, Reginald. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeatherViewController: UIViewController {

    
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var max: UILabel!
    @IBOutlet weak var min: UILabel!
    @IBOutlet weak var wDescription: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var wSpeed: UILabel!
    @IBOutlet weak var wDegree: UILabel!
    @IBOutlet weak var cloudiness: UILabel!
    var city:String!
    var country:String!
    let apiKey = "6955299913c82198f5388d12876cc7bd"
    
    @IBOutlet weak var location: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.city != nil && self.country != nil {
            self.location.text = "\(city!) \(country!)"
            let params:Parameters = ["q": "\(city!),\(country!)", "units": "imperial", "appid": apiKey]
            AF.request("http://api.openweathermap.org/data/2.5/weather", parameters:params).responseJSON(completionHandler: { (response) in
                if response.result.isSuccess {
                    print(response.result.value!)
                    
                    let data = response.result.value as! [String:Any]
                    let mainJson = data["main"] as! [String:Any]
                    let main = WeatherInfo(json: mainJson)

                    let windJson = data["wind"] as! [String:Any]
                    let wind = Wind(json: windJson)
                    
                    let cloudJson = data["clouds"] as! [String:Any]
                    let cloud = Clouds(json: cloudJson)
                    
                    self.temp.text = "\(main.temp!) F"
                    self.max.text = "\(main.tempMax!) F"
                    self.min.text = "\(main.tempMin!) F"
                    self.humidity.text = "\(main.humidity!) %"
                    self.wSpeed.text = "\(wind.speed!) miles/hr"
                    self.wDegree.text = "\(wind.degree!) degrees"
                    self.cloudiness.text = "\(cloud.cloudiness!) %"
                }else{
                    print("Error.")
                }
            })
        }
    }

}
