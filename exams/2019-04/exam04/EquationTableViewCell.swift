//
//  EquationTableViewCell.swift
//  exam04
//
//  Created by d0m on 20/01/2020.
//  Copyright © 2020 d0m. All rights reserved.
//

import UIKit

class EquationTableViewCell: UITableViewCell {

    @IBOutlet weak var xValue: UILabel!
    @IBOutlet weak var yValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
