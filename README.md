# Bidirectional MVVM (for iOS, Swift 4)

## Why?

Because I wanted to see how I can do "real" MVVM, that dynamically exchanges data between view and model (not, as in most examples, only sends data to view).

In addition it's a  real-world example of Swift 4 key path usage.

## Structure of project

Project is divived in 4 groups, to keeps things simple:
- Binding - `KeyPathBinding`, for simplicity it handles only `String` data types
- Model - `Credentials` model (with 2 string fields)
- ViewModel - you should do all model and view operation via `LoginViewModel` class
- Controller - in which you bind `UITextFields` to our view model

## Important note about structs

This example works for structs, however each binding creates it's own struct copy.
