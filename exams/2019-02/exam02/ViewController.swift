//
//  ViewController.swift
//  exam02
//
//  Created by d0m on 14/01/2020.
//  Copyright © 2020 d0m. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource {
    
    var prices: [Double] = []

    @IBOutlet weak var salesTableView: UITableView!
    
    @IBOutlet weak var price: UITextField!
    
    
    @IBOutlet weak var slider: UISlider!
    @IBAction func computePrices(_ sender: UIButton) {
        prices.removeAll()
        if let price = price.text {
            if let price = Double(price) {
                slider.value = Float(price)
                
                for i in 0..<20 {
                    let new_price = price * Double(100-i*5) / 100.0
                    prices.append(new_price)
                }
            }
        salesTableView.reloadData()
        }
        
    }
    @IBAction func slidePrice(_ sender: UISlider) {
        price.text = String(sender.value.rounded())
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        salesTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sales", for: indexPath) as! salesTableViewCell
        let row = indexPath.row
        cell.price.text = "Prix : " + String(prices[row]) + " €"
        cell.rate.text = String(row * 5) + " %"
        return cell
    }


}

