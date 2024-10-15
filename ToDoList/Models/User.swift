//
//  User.swift
//  ToDoList
//
//  Created by Hakob Ghlijyan on 10.10.2024.
//

import Foundation

struct User : Codable {
    let id: String
    let name: String
    let email: String
    let joinedDate: TimeInterval
}
