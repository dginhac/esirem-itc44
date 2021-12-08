//
//  TableViewCell.swift
//  MonPremierTableView
//
//  Created by d0m on 30/11/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myDescription: UILabel!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
