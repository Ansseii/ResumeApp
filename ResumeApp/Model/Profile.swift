//
//  Profile.swift
//  ResumeApp
//
//  Created by Aleksandr on 30.08.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//

enum MaritalStatus {
    case single
    case married
    case divorced
}

struct Profile {
    let name: String
    let surname: String
    let age: Int
    let maritalStatus: MaritalStatus
    let city: String
    let agesCount: Int
    let profession: String
    let hobbies: [String]
    
    init(name: String, surname: String, age: Int,
         maritalStatus: MaritalStatus, city: String,
         agesCount: Int, profession: String, hobbies: [String]) {
        self.name = name
        self.surname = surname
        self.age = age
        self.maritalStatus = maritalStatus
        self.city = city
        self.agesCount = agesCount
        self.profession = profession
        self.hobbies = hobbies
    }
}

extension Profile {
    static func getInMemoryProfile() -> Profile {
        return Profile(name: "Aleksandr", surname: "Lukash", age: 28,
                       maritalStatus: .married, city: "Saint-Petersburg",
                       agesCount: 7 ,profession: "Java Developer",
                       hobbies: ["diving", "rope-jumping", "parachuting"])
    }
}
