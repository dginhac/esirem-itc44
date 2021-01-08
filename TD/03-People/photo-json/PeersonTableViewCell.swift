//
//  PersonTableViewCell.swift
//  photo-json
//
//  Created by d0m on 16/12/2020.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
}
