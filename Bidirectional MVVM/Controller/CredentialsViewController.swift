//
//  CredentialsViewController.swift
//  Bidirectional MVVM
//
//  Created by Tomasz Wójcik on 12/10/2017.
//  Copyright © 2017 Tomasz Wójcik. All rights reserved.
//

import Foundation
import UIKit

class CredentialsViewController: UIViewController {
    var viewModel: LoginViewModel!

    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var passwordLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // We don't hasve support for UILabel binding (yet)
        emailLabel.text = viewModel.email.value
        passwordLabel.text = viewModel.password.value
    }

    @IBAction func goBackToLogin(_ sender: UIButton) {
        sender.isEnabled = false
        let loginVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "login")
        UIApplication.shared.keyWindow?.rootViewController = loginVC
    }
}
