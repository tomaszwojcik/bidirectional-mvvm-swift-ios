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
        didSet { /* NOP, see debugger output */ }
    }
    var password: String {
        didSet { /* NOP, see debugger output */ }
    }

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
