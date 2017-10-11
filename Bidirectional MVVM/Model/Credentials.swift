//
//  Credentials.swift
//  Bidirectional MVVM
//
//  Created by Tomasz Wójcik on 11/10/2017.
//  Copyright © 2017 Tomasz Wójcik. All rights reserved.
//

import Foundation

class Credentials {
    var email: String
    var password: String

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
