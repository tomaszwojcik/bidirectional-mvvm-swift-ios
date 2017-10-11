//
//  LoginViewController.swift
//  Bidirectional MVVM
//
//  Created by Tomasz Wójcik on 11/10/2017.
//  Copyright © 2017 Tomasz Wójcik. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    let credentials = Credentials(email: "me@zavaster.com", password: "Secret1234")

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    private lazy var viewModel: LoginViewModel = {
        let viewModel = LoginViewModel(credentials: credentials)
        return viewModel
    }()

    override func viewDidLoad() {
        viewModel.email.bind(to: emailTextField)
        viewModel.password.bind(to: passwordTextField)
    }

    @IBAction func clearInput(_ sender: Any) {
        viewModel.email.value = ""
        viewModel.password.value = ""
    }

    @IBAction func performLogin(_ sender: UIButton) {
        sender.isEnabled = false
        let alert = UIAlertController(
            title: "Logged in!",
            message: "Email: \(viewModel.email.value), pass: \(viewModel.password.value)",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok!", style: .default, handler: { _ in
            sender.isEnabled = true
        }))
        present(alert, animated: true, completion: nil)
    }
}
