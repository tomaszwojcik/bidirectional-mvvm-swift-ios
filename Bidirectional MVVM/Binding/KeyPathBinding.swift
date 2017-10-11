//
//  KeyPathBinding.swift
//  Bidirectional MVVM
//
//  Created by Tomasz Wójcik on 11/10/2017.
//  Copyright © 2017 Tomasz Wójcik. All rights reserved.
//

import Foundation
import UIKit

class KeyPathBinding<Type> {
    private let object: Type
    private let keyPath: ReferenceWritableKeyPath<Type, String>
    private weak var textField: UITextField?

    init(object: Type, keyPath: ReferenceWritableKeyPath<Type, String>) {
        self.object = object
        self.keyPath = keyPath
    }

    var value: String {
        get {
            return object[keyPath: keyPath]
        }

        set {
            object[keyPath: keyPath] = newValue
            textField?.text = newValue
        }
    }

    func bind(to textField: UITextField) {
        self.textField = textField
        textField.text = value
        textField.addTarget(self, action: #selector(didChange(textField:)), for: .allEditingEvents)
    }

    @objc private func didChange(textField: UITextField) {
        value = textField.text ?? ""
    }
}
