//
//  KeyPathBinding.swift
//  Bidirectional MVVM
//
//  Created by Tomasz Wójcik on 11/10/2017.
//  Copyright © 2017 Tomasz Wójcik. All rights reserved.
//

import Foundation
import UIKit

class KeyPathBinding<ModelType> {
    // Model that will be modified (*MUST* be var)
    private var model: ModelType!
    // Key path to value in the model
    private let valueKeyPath: WritableKeyPath<ModelType, String>
    // Textfield that will be bound to the value
    private weak var textField: UITextField?

    // You can set bidirectional or unidirectional updates (or none which is a nonsense)
    // When model changes then update view (text field)
    var allowViewUpdatesFromModel: Bool = true
    // When view (text field) changes then update model
    var allowModelUpdatesFromView: Bool = true

    init(model: ModelType, valueKeyPath: WritableKeyPath<ModelType, String>) {
        self.model = model
        self.valueKeyPath = valueKeyPath
    }

    deinit {
        print("KeyPathBinding deinit")
    }

    var value: String {
        get {
            return model[keyPath: valueKeyPath]
        }

        set {
            model[keyPath: valueKeyPath] = newValue
            if allowViewUpdatesFromModel {
                textField?.text = newValue
            }
        }
    }

    // Start listening view changes
    func bind(to textField: UITextField) {
        self.textField = textField
        textField.text = value
        textField.addTarget(self,
                            action: #selector(didChange(textField:)),
                            for: .allEditingEvents)
    }

    // Stop listening view changes
    func unbind() {
        textField?.removeTarget(self,
                                action: #selector(didChange(textField:)),
                                for: .allEditingEvents)
    }

    @objc private func didChange(textField: UITextField) {
        if allowModelUpdatesFromView {
            value = textField.text ?? ""
        }
    }
}
