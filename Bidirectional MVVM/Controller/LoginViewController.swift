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
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    private lazy var viewModel: LoginViewModel = {
        let credentials = Credentials(email: "me@zavaster.com", password: "Secret1234")
        return LoginViewModel(credentials: credentials)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.email.bind(to: emailTextField)
        viewModel.password.bind(to: passwordTextField)
    }

    @IBAction func clearInput(_ sender: Any) {
        viewModel.email.value = ""
        viewModel.password.value = ""
    }

    @IBAction func login(_ sender: UIButton) {
        sender.isEnabled = false
        let credentialsVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "credentials") as! CredentialsViewController
        credentialsVC.viewModel = viewModel
        UIApplication.shared.keyWindow?.rootViewController = credentialsVC
    }
}
