//
//  ViewController.swift
//  exam01
//
//  Created by d0m on 13/01/2020.
//  Copyright © 2020 d0m. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var wordTableView: UITableView!
    
    let identifier = "wordCell"
    
    var words = ["observation","witty","flavor","questionable","transport","thirsty","shrug","guitar","cagey","attend","fool","blot", "double","hesitant","sleepy","spring","impolite","well-off","cats","allurin"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wordTableView.dataSource = self
    }
    
    @IBAction func wordsSort(_ sender: UIButton) {
        words.sort(by: {$0.count < $1.count})
        //words.sort()
        wordTableView.reloadData()
    }
    
    @IBAction func wordsShuffle(_ sender: UIButton) {
        words.shuffle()
        wordTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! WordTableViewCell
        let row = indexPath.row
        cell.word.text = words[row] + " (" + String(words[row].count) + " chars)"
        
        
        return cell
        
    }


}

