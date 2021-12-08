//
//  ViewController.swift
//  photo-json
//
//  Created by d0m on 14/12/2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = peopleTableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonTableViewCell
        let row = indexPath.row
        
        if row%2 == 0 {
            cell.backgroundColor = UIColor.systemGray6
        }
        else {
            cell.backgroundColor = UIColor.white
        }
        //cell.thumbnail
        cell.lastname.text = data[row].name.fullName()
        cell.email.text = data[row].email
        cell.thumbnail.load(urlString: data[row].picture.medium)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: {(action, view, completionHandler) in
            let row = indexPath.row
            self.data.remove(at: row)
            completionHandler(true)
            tableView.reloadData()
        })
        ])
        return configuration
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let path = Bundle.main.path(forResource: "people", ofType: "json") {
            if let str = try? String(contentsOfFile: path) {
                let rawData = Data(str.utf8)
                if let jsonData = try? JSONDecoder().decode(People.self, from: rawData) {
                    data = jsonData.people
                    data.sort{$0.name.last < $1.name.last}
                    
                    print (data.count)
                    for p in data {
                        print (p.name.last)
                    }
                }
                else {
                    errorMsg = "ERROR: no json data"
                }
            }
            else {
                errorMsg = "ERROR: no txt data"
            }
        }
        else {
            errorMsg = "ERROR: File does not exist"
        }
        
        if let error = errorMsg {
            print (error)
        }
        
        peopleTableView.dataSource = self
        peopleTableView.delegate = self
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController {
            let row = peopleTableView.indexPathForSelectedRow!.row
            vc.data = data[row]
            
        }
    }
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.data = data[row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
 */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        peopleTableView.reloadData()
    }
    
    @IBOutlet weak var peopleTableView: UITableView!
    
    var data: [Person] = []
    var errorMsg: String?
    
    
   


}

