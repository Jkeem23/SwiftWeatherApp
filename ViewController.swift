//
//  ViewController.swift
//  InClass08
//
//  Created by Smith, Reginald on 3/20/19.
//  Copyright © 2019 Smith, Reginald. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let data = AppData()
    var cities = [String: [String]]()
    var countries = [String]()
    var selectedCity:String?
    var selectedCountry:String?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cities = data.cities
        print(self.cities)
        countries.append(contentsOf: self.cities.keys)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.cities[countries[section]]?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let country = self.countries[indexPath.section]
        let city = self.cities[country]![indexPath.row]
        
        cell.textLabel?.text = city
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let country = countries[section]
        return country
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UITableViewCell
        selectedCity = cell.textLabel?.text
        selectedCountry = countries[indexPath.section]
        print(selectedCity!)
        print(selectedCountry!)
        performSegue(withIdentifier: "toCurrentWeather", sender: self)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toCurrentWeather" {
                let destinationVC = segue.destination as! CurrentWeatherViewController
                destinationVC.city = selectedCity
                destinationVC.country = selectedCountry
            }
        }
    }
    


