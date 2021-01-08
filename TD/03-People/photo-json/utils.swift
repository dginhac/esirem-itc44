//
//  utils.swift
//  photo-json
//
//  Created by d0m on 16/12/2020.
//

import Foundation
import UIKit

extension UIImageView {
    func load(urlString: String) {
        if let url = URL(string: urlString) {
            DispatchQueue.global().async {
                if let rawData  = try? Data(contentsOf: url) {
                    if let image = UIImage(data: rawData) {
                        DispatchQueue.main.async {
                            self.image = image
                        }
                    }
                }
            }
        }
    }
}
