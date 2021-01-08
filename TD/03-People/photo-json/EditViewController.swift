//
//  EditViewController.swift
//  photo-json
//
//  Created by d0m on 06/01/2021.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let person = data {
            firstname.text = person.name.first
            lastname.text = person.name.last
            email.text = person.email
            picture.load(urlString: person.picture.large)
        }
        else {
            firstname.text = "ERROR"
            lastname.text = ""
            email.text = ""
        }
        
        firstname.delegate = self
        lastname.delegate = self
        email.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        data!.name.first = firstname.text!
        data!.name.last = lastname.text!
        data!.email = email.text!
        return true
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            data!.name.first = firstname.text!
            data!.name.last = lastname.text!
            data!.email = email.text!
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var picture: UIImageView!
    
    var data: Person?
}
