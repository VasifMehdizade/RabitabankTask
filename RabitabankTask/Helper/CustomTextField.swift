//
//  CustomTextField.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import UIKit

struct TextFieldValidation {
    var min: Int?
    var max: Int?
}

protocol TextFieldViewDelegate {
    func textFieldViewDidBeginEditing(_ textFieldView: TextFieldView)
    func textFieldViewDidEndEditing(_ textFieldView: TextFieldView)
    func textFieldViewChangedEditing(_ textFieldView: TextFieldView)
}

extension TextFieldViewDelegate {
    func textFieldViewDidBeginEditing(_ textFieldView: TextFieldView) {}
    func textFieldViewDidEndEditing(_ textFieldView: TextFieldView) {}
    func textFieldViewChangedEditing(_ textFieldView: TextFieldView) {}
}

final class TextFieldView: UIView {
    
    var delegate: TextFieldViewDelegate!
    
    var text: String? {
        get {
            return textField.text
        }
        }
    
    var isActive: Bool = false {
        didSet {
            if isActive {
                self.bodyView.layer.borderWidth = 2
            }
            else {
                self.bodyView.layer.borderWidth = 0
            }
        }
    }
    
    private lazy var bodyView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        view.isUserInteractionEnabled = false
        return view
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 6
        textField.autocorrectionType = UITextAutocorrectionType.no
        UITextField.appearance().tintColor = .black
        textField.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
        textField.addTarget(self, action: #selector(textFieldChangedEditing(_:)), for: .editingChanged)
        return textField
    }()
    
    var validation: TextFieldValidation?
    
    var validationStatus: Bool = false

    private var textFieldTrailingConstraint: NSLayoutConstraint!

    required init() {
        super.init(frame: .zero)
            self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupUI() {
        addSubview(bodyView)
        bodyView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, bottom: 0),
                        size: .init(width: 0, height: 72))
        
        addSubview(textField)
        textField.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil,
                         padding: .init(top: 16, left: 8, bottom: -16, right: 0),
                         size: .init(width: 0, height: 40))
        
        textFieldTrailingConstraint = textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        textFieldTrailingConstraint.isActive = true
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        self.isActive = true
        
        if let delegate = self.delegate {
            delegate.textFieldViewDidBeginEditing(self)
        }
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        self.isActive = false
        
        if let delegate = self.delegate {
            delegate.textFieldViewDidEndEditing(self)
        }
    }
    
    @objc func textFieldChangedEditing(_ textField: UITextField) {
        if self.validation != nil {
            let count = textField.text!.count
            
            var minStatus: Bool = false
            if let min = self.validation!.min {
                if count >= min {
                    minStatus = true
                }
            } else {
                minStatus = true
            }
            
            var maxStatus: Bool = false
            if let max = self.validation!.max {
                if self.validation!.min == nil {
                    if count == max {
                        maxStatus = true
                    }
                } else {
                    if count <= max {
                        maxStatus = true
                    }
                }
            } else {
                maxStatus = true
            }
            
            self.validationStatus = (minStatus && maxStatus)
        }
        
        if let delegate = self.delegate {
            delegate.textFieldViewChangedEditing(self)
        }
    }
}
