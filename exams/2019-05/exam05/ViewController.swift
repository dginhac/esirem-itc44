//
//  ViewController.swift
//  exam05
//
//  Created by d0m on 21/01/2020.
//  Copyright © 2020 d0m. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource {
    
    
    var weathers = [Weather]()

    let identifier = "weatherCell"
    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var sortButton: UIButton!
    
    var sortTemp = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tokyo = Weather(city: "Tokyo", country: "Japon", temperature: 24.3)
        let nairobi = Weather(city: "Nairobi", country: "Kenya", temperature: 32.4)
        let denver = Weather(city: "Denver", country: "Etats-Unis (Colorado)", temperature: 4.8)
        let berlin = Weather(city: "Berlin", country: "Allemagne", temperature: 4.6)
        let rio = Weather(city: "Rio", country: "Bresil", temperature: 25.1)
        let moscou = Weather(city: "Moscou", country: "Russie", temperature: -18.7)
        let helsinki = Weather(city: "Helsinki", country: "Finlande", temperature: -15.0)
        let oslo = Weather(city: "Oslo", country: "Norvege", temperature: -5.4)
        let lisbonne = Weather(city: "Lisbonne", country: "Portugal", temperature: 15.5)
        let stockolm = Weather(city: "Stockolm", country: "Suède", temperature: -5.4)
        let bogota = Weather(city: "Bogota", country: "Colombie", temperature: 19.2)
        let marseille = Weather(city: "Marseille", country: "France", temperature: 15.9)
        let cincinnati = Weather(city: "Cincinnati", country: "Etats-Unis (Ohio)", temperature: -2.4)
        let sofia = Weather(city: "Sofia", country: "Bulgarie", temperature: -3.4)
        weathers.append(tokyo)
        weathers.append(nairobi)
        weathers.append(denver)
        weathers.append(berlin)
        weathers.append(rio)
        weathers.append(moscou)
        weathers.append(helsinki)
        weathers.append(oslo)
        weathers.append(lisbonne)
        weathers.append(stockolm)
        weathers.append(bogota)
        weathers.append(marseille)
        weathers.append(cincinnati)
        weathers.append(sofia)
        weatherTableView.dataSource = self
    }
    
    
    @IBAction func updateTemperatures(_ sender: UIButton) {
        for weather in weathers {
            weather.updateTemperature()
        }
        weatherTableView.reloadData()
    }
    
    @IBAction func sortTemperatures(_ sender: UIButton) {
        if sortTemp == true {
            weathers.sort(by: {$0.temperature < $1.temperature})
            sortButton.setTitle("Tri Villes", for: .normal)
            sortTemp = false
        }
        else {
            weathers.sort(by: {$0.city < $1.city})
            sortTemp = true
            sortButton.setTitle("Tri Temp.", for: .normal)
        }
        weatherTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! WeatherTableViewCell
        let row = indexPath.row
        if weathers[row].temperature < 0 {
            cell.backgroundColor = UIColor.systemBlue
        }
        else if weathers[row].temperature < 25 {
            cell.backgroundColor = UIColor.systemGreen
        }
        else {
            cell.backgroundColor = UIColor.systemRed
        }
        cell.city.textColor = UIColor.white
        cell.country.textColor = UIColor.white
        cell.temperature.textColor = UIColor.white
        cell.city.text = weathers[row].city
        cell.country.text = weathers[row].country
        cell.temperature.text = String(format: "%.1f", weathers[row].temperature) + " °"
        return cell
    }
}

