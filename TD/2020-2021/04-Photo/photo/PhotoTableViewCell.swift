//
//  PhotoTableViewCell.swift
//  testTableView
//
//  Created by d0m on 09/12/2019.
//  Copyright © 2019 d0m. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    // The two IBOutlets of the tableViewCell used into the function that returns a cell in the viewControler
    // No more code is required here.
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var photoTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
