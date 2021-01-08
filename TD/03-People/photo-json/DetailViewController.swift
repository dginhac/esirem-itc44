//
//  DetailViewController.swift
//  photo-json
//
//  Created by d0m on 06/01/2021.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let person = data {
            name.text = person.name.fullName()
            email.text = person.email
            picture.load(urlString: person.picture.large)
        }
        else {
            name.text = "ERROR"
            email.text = ""
        }

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    
    var data: Person?
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? EditViewController {
            vc.data = data
        }
    }
    
    @IBAction func cancel(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? EditViewController {
            vc.dismiss(animated: true, completion: nil)
            print ("cancel")
        }
    }
    
    @IBAction func save(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? EditViewController {
            
            if let updatedPerson = vc.data {
                print ("save")
                print (updatedPerson.name.fullName())
                name.text = updatedPerson.name.fullName()
                email.text = updatedPerson.email
                data?.name.first = updatedPerson.name.first
                data?.name.last = updatedPerson.name.last
                data?.email = updatedPerson.email
                
            }
        }
    }
    

}
