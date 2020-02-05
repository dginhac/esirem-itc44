//
//  ViewController.swift
//  exam04
//
//  Created by d0m on 20/01/2020.
//  Copyright © 2020 d0m. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let identifier = "equationCell"

    var coeffs = [Int]()
    var xValue = [Double]()
    var yValue = [Double]()
    
    @IBOutlet weak var maxi: UITextField!
    @IBOutlet weak var mini: UITextField!
    @IBOutlet weak var equationTableView: UITableView!
    @IBOutlet weak var equation: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func updateRange(_ sender: UITextField) {
        print (sender.text)
    }
    @IBAction func generateCoeffs(_ sender: UISlider) {
        coeffs.removeAll()
        xValue.removeAll()
        yValue.removeAll()
        let degree = Int(sender.value)
        for _ in 0...degree {
            let coeff = Int.random(in: -10 ..< 10)
            coeffs.append(coeff)
        }
        var equationStr = "y = " + String(coeffs[0])
        for i in 1...degree {
            equationStr += " + " + String(coeffs[i]) + "x^" + String(i)
        }
        equation.text = equationStr
        
        var min = 0.0
        if let minStr = mini.text {
            if let minValue = Double(minStr) {
                min = minValue
            }
        }
        var max = 10.0
        if let maxStr = maxi.text {
            if let maxValue = Double(maxStr) {
                max = maxValue
            }
        }
        
        let step = 0.5
        let number = Int((max - min) / step)
        
        for i in 0...number {
            let x = min + Double(i)*step
            xValue.append(x)
            var y = 0.0
            for j in 0..<coeffs.count {
                y += Double(coeffs[j]) * pow(x, Double(j))
            }
            yValue.append(y)
        }
        equationTableView.reloadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        equationTableView.dataSource = self
        
        
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return xValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! EquationTableViewCell
        let row = indexPath.row
        cell.xValue.text =  "x = " + String(xValue[row])
        cell.yValue.text = "y = " + String(yValue[row])
        return cell
    }
}

