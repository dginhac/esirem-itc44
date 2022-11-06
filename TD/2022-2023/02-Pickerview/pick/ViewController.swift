//
//  ViewController.swift
//  pick
//
//  Created by d0m on 27/10/2022.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var data: [String] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var number = ""
        for component in 0..<pickerView.numberOfComponents {
            number += data[pickerView.selectedRow(inComponent: component)]
        }
        label.text = number
    }
    
    @IBAction func ResetClick(_ sender: Any) {
        label.text = "0000"
        for component in 0..<picker.numberOfComponents {
            picker.selectRow(0, inComponent: component, animated: true)
        }
    }
    
    @IBAction func randomClick(_ sender: Any) {
        var number = ""
        for component in 0..<picker.numberOfComponents {
            let value = Int.random(in: 0..<10)
            number += String(value)
            picker.selectRow(value, inComponent: component, animated: true)
        }
        label.text = number
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        picker.dataSource = self
        picker.delegate = self
        
        for i in 0..<10 {
            data.append(String(i))
        }
        
    }


}

