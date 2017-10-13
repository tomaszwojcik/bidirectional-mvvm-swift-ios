//
//  LoginViewModel.swift
//  Bidirectional MVVM
//
//  Created by Tomasz Wójcik on 11/10/2017.
//  Copyright © 2017 Tomasz Wójcik. All rights reserved.
//

import Foundation

class LoginViewModel {
    private let credentials: Credentials

    let email: KeyPathBinding<Credentials>
    let password: KeyPathBinding<Credentials>

    init(credentials: Credentials) {
        self.credentials = credentials
        email = KeyPathBinding(model: credentials, valueKeyPath: \.email)
        password = KeyPathBinding(model: credentials, valueKeyPath: \.password)
    }

    deinit {
        print("LoginViewModel deinit")
        email.unbind()
        password.unbind()
    }
}
