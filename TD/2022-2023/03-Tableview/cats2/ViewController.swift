//
//  ViewController.swift
//  cats2
//
//  Created by d0m on 28/10/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        
        let row = indexPath.row
        cell.myLabel.text = myData[row].desc
        
        let img = myData[row].img
        cell.myImg.image = UIImage(named: String(img))
        
        return cell
    }
    
    
    var myData : [MyData] = []

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 1...100 {
            let desc = "Ceci est la description de l'image " + String(i)
            let imgNb = Int.random(in: 1...10)
            let d = MyData(img: imgNb, desc: desc)
            myData.append(d)
        }
        myTableView.dataSource = self
        
    }


}

