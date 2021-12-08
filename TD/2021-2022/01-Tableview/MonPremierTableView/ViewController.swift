//
//  ViewController.swift
//  MonPremierTableView
//
//  Created by d0m on 30/11/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var myData = [MyData]()
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 1...50 {
            
            myData.append(MyData(title: "Voiture " + String(i),
                                 description: "Description de la voiture " + String(i) + "\n Superbe voiture, peu de km, parfait entretien",
                                 image: String(Int.random(in: 1...5))))
        }
        
        myTableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        cell.myTitle.text = myData[indexPath.row].title
        cell.myDescription.text = myData[indexPath.row].description
        cell.myImage.image = UIImage(named: myData[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Find the row of the cell
            let row = indexPath.row
            myData.remove(at: row)
            myTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let detailsViewController = segue.destination as! DetailsViewController
            let myIndexPath = myTableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailsViewController.myData = myData[row]
        }
    }
    
    
    @IBAction func unwindToMainView(_ unwindSegue: UIStoryboardSegue) {
        let addViewController = unwindSegue.source as! AddViewController
        if unwindSegue.identifier == "cancel" {
            addViewController.dismiss(animated: true, completion: nil)
        }
        if unwindSegue.identifier == "save" {
            if let myTitle = addViewController.myTitle.text, let myDescription = addViewController.myDescription.text {
                let new_data = MyData(title: myTitle,
                                      description: myDescription,
                                      image: String(Int.random(in: 1...5)))
                myData.append(new_data)
                myTableView.reloadData()
            }
        }
        // Use data from the view controller which initiated the unwind segue
    }


}

