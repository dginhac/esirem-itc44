//
//  People.swift
//  photo-json
//
//  Created by d0m on 14/12/2020.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let people = try? newJSONDecoder().decode(People.self, from: jsonData)

import Foundation

// MARK: - People
class People: Codable {
    var people: [Person]

    init(people: [Person]) {
        self.people = people
    }
}

// MARK: - Person
class Person: Codable {
    var gender: Gender
    var name: Name
    var email: String
    var picture: Picture
    var nat: String

    init(gender: Gender, name: Name, email: String, picture: Picture, nat: String) {
        self.gender = gender
        self.name = name
        self.email = email
        self.picture = picture
        self.nat = nat
    }
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

// MARK: - Name
class Name: Codable {
    var title: Title
    var first, last: String

    init(title: Title, first: String, last: String) {
        self.title = title
        self.first = first
        self.last = last
    }
    
    func fullName() -> String {
        return first + " " + last
    }
    
}

enum Title: String, Codable {
    case miss = "Miss"
    case monsieur = "Monsieur"
    case mr = "Mr"
    case mrs = "Mrs"
    case ms = "Ms"
}

// MARK: - Picture
class Picture: Codable {
    var large, medium, thumbnail: String

    init(large: String, medium: String, thumbnail: String) {
        self.large = large
        self.medium = medium
        self.thumbnail = thumbnail
    }
}
