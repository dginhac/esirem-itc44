//
//  TableViewCell.swift
//  cats2
//
//  Created by d0m on 28/10/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myImg: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
