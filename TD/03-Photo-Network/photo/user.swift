//
//  user.swift
//  photo
//
//  Created by d0m on 13/01/2020.
//  Copyright © 2020 d0m. All rights reserved.
//

import Foundation

struct User: Codable {
    var firstname:String
    var lastname:String
    var gender:String
    var picture:String
    var thumbnail:String
    var size:Int
    var description:String
}
