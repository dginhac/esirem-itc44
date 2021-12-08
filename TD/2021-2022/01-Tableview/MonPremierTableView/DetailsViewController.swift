//
//  DetailsViewController.swift
//  MonPremierTableView
//
//  Created by d0m on 30/11/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var myData: MyData?

    @IBOutlet weak var myDescription: UILabel!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = myData {
            myTitle.text = data.title
            myDescription.text = data.description
            myImage.image = UIImage(named: data.image)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
