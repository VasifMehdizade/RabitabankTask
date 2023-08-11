//
//  LoginController.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import UIKit

class LoginController: BaseVC {
    
    var sendNameCallBack: ((String)->())?
    
    lazy var nameTextField: TextFieldView = {
        let view = TextFieldView()
        view.textField.keyboardType = .emailAddress
        view.textField.isUserInteractionEnabled = true
        view.textField.placeholder = "Name"
        view.textField.delegate = self
        view.validation = TextFieldValidation(min: 4, max: 35)
        return view
    }()
    
    lazy var passwordTextField: TextFieldView = {
        let view = TextFieldView()
        view.textField.keyboardType = .emailAddress
        view.textField.isUserInteractionEnabled = true
        view.textField.placeholder = "Password"
        view.textField.delegate = self
        view.textField.isSecureTextEntry = true
        view.validation = TextFieldValidation(min: 6, max: 12)
        return view
    }()
    
    lazy var fieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameTextField, passwordTextField])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.spacing = 8
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    
    lazy var submitButton: CustomButtonView = {
        let button = CustomButtonView()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.black, for: .normal)
        button.title = "Sign In"
        button.click = { [weak self] in
            guard let self = self else {return}
            self.submitButtonClicked()
            self.sendNameCallBack?(self.nameTextField.text!)
        }
        return button
    }()
    
    override func setupView() {
        super.setupView()
        view.addSubview(fieldStackView)
        view.addSubview(submitButton)
    }
    
    override func setupAnchors() {
        super.setupAnchors()
        fieldStackView.anchor(top: view.topAnchor,
                              leading: view.leadingAnchor,
                              trailing: view.trailingAnchor,
                              padding: .init(top: 200,leading: 24,trailing: -24), size: .init( width: 0, height: 152))
        
        submitButton.anchorSize(.init(width: 0, height: 56))
        submitButton.anchor(leading: view.leadingAnchor,
                               bottom: view.layoutMarginsGuide.bottomAnchor,
                               trailing: view.trailingAnchor,
                               padding: .init(leading: 24,bottom: 0,trailing: -24))
    }
    
    @objc func submitButtonClicked() {
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.main()
    }
}

extension LoginController: TextFieldViewDelegate, UITextFieldDelegate {
    func textFieldViewDidBeginEditing(_ textFieldView: TextFieldView) {
    }
    func textFieldViewDidEndEditing(_ textFieldView: TextFieldView) {
    }
    func textFieldViewChangedEditing(_ textFieldView: TextFieldView) {
        func textFieldViewChangedEditing(_ textFieldView: TextFieldView) {
            switch textFieldView {
            case nameTextField:
                if textFieldView.text!.isEmpty {
                    textFieldView.validationStatus = false
                } else {
                    textFieldView.validationStatus = true
                }
            case passwordTextField:
                if textFieldView.text!.isEmpty || !textFieldView.validationStatus {
                    textFieldView.validationStatus = false
                } else {
                    textFieldView.validationStatus = true
                }
            default:
                break
            }
        }
    }
}

