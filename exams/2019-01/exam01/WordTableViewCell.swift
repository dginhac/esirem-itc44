//
//  WordTableViewCell.swift
//  exam01
//
//  Created by d0m on 13/01/2020.
//  Copyright © 2020 d0m. All rights reserved.
//

import UIKit

class WordTableViewCell: UITableViewCell {

    @IBOutlet weak var word: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
