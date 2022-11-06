//
//  ViewController.swift
//  basicApp
//
//  Created by d0m on 12/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var myCar: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    let otherText = "Hello World"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //myButton.titleLabel?.text="Click me"
        myButton.setTitle("Click me", for:   .normal)
        myLabel.text = otherText
    }

    @IBAction func updateAlpha(_ sender: UISlider) {
        myCar.alpha = CGFloat(sender.value)
    }
    
    @IBAction func updateLabel(_ sender: UIButton) {
        if myLabel.textColor == UIColor.red {
            myLabel.textColor = UIColor.blue
        }
        else {
            myLabel.textColor = UIColor.red
        }
    }
}

