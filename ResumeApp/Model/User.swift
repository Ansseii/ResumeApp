//
//  User.swift
//  ResumeApp
//
//  Created by Aleksandr on 29.08.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//

struct User {
    let login: String
    let password: String
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.login == rhs.login &&
            lhs.password == rhs.password
    }
}

extension User {
    static func getInMemoryUser() -> User {
        User(login: "test_user", password: "password")
    }
}
