//
//  Credentials.swift
//  Bidirectional MVVM
//
//  Created by Tomasz Wójcik on 11/10/2017.
//  Copyright © 2017 Tomasz Wójcik. All rights reserved.
//

import Foundation

struct Credentials {
    var email: String {
        didSet { print("didSet email to \(email)") }
    }
    var password: String {
        didSet { print("didSet password to \(password)") }
    }

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
