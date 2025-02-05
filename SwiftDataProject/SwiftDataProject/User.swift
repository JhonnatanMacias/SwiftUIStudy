//
//  User.swift
//  SwiftDataProject
//
//  Created by Jhonnatan Macias on 28/10/24.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date

    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
