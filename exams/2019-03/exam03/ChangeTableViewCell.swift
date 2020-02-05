//
//  ChangeTableViewCell.swift
//  exam03
//
//  Created by d0m on 20/01/2020.
//  Copyright © 2020 d0m. All rights reserved.
//

import UIKit

class ChangeTableViewCell: UITableViewCell {

    @IBOutlet weak var currency: UILabel!
    @IBOutlet weak var amount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
