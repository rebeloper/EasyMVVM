//
//  User.swift
//  EasyMVVM
//
//  Created by Alex Nagy on 09/02/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import UIKit

struct User {
    let name: String
    let age: Int
    let backgroundColor: UIColor
    
    init(name: String, age: Int, backgroundColor: UIColor) {
        self.name = name
        self.age = age
        self.backgroundColor = backgroundColor
    }
}

