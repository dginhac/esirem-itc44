//
//  ViewController.swift
//  exam03
//
//  Created by d0m on 20/01/2020.
//  Copyright © 2020 d0m. All rights reserved.
//

import UIKit

struct Currency {
    var title: String
    var rate: Double
}

class ViewController: UIViewController, UITableViewDataSource {
    
    let identifier = "changeCell"

    var monnaies = ["Dollar des Etats-Unis (USD)", "Livre sterling (GBP)", "Yen japonais (JPY)", "Franc suisse (CHF)", "Dollar canadien (CAD)", "Yuan chinois (CNY)", "Dollar australien (AUD)", "Real brésilien (BRL)", "Won coréen (KRW)", "Peso méxicain (MXN)", "Ringgit malaisien (MYR)", "Couronne norvégienne (NOK)", "Rouble russe (RUB)", "Couronne suédoise (SEK)","Couronne danoise (DKK)"]
    var tauxDeChange = [1.1108, 0.85105, 122.31, 1.0736, 1.4498, 7.6186, 1.6122, 4.639, 1288.37, 20.8338, 4.5041, 9.889, 68.2495, 10.545, 7.4729]
    var montants = [Double]()

    @IBOutlet weak var changeTableView: UITableView!
    
    @IBOutlet weak var euroTextField: UITextField!
    
    @IBOutlet weak var stepper: UIStepper!
    
    
    @IBAction func updateAmount(_ sender: UIStepper) {
        euroTextField.text = String(sender.value)
        montants.removeAll()
        for taux in tauxDeChange {
            montants.append(taux*sender.value)
        }
        changeTableView.reloadData()
    }
    @IBAction func change(_ sender: UIButton) {
        montants.removeAll()
        if let euroTxt = euroTextField.text {
            if let euro = Double(euroTxt) {
                stepper.value = Double(euro)
                for taux in tauxDeChange {
                    montants.append(taux*euro)
                }
            }
        }
        print (montants)
        changeTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        changeTableView.dataSource = self
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return montants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ChangeTableViewCell
        let row = indexPath.row
        cell.currency.text = monnaies[row]
        cell.amount.text = String(montants[row].rounded())
        
        
        return cell
    }

}

