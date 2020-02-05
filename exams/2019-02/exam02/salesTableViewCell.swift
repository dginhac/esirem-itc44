//
//  salesTableViewCell.swift
//  exam02
//
//  Created by d0m on 15/01/2020.
//  Copyright © 2020 d0m. All rights reserved.
//

import UIKit

class salesTableViewCell: UITableViewCell {

    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
