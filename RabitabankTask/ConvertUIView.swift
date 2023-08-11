//
//  ConvertUIView.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import UIKit

class ConverterUiView: UIView {

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    lazy var iconView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.backgroundColor = .green
        return image
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, descLabel])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconView, labelStackView])
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    lazy var convertTextField: UITextField = {
        let view = UITextField()
        view.keyboardType = .default
        view.isUserInteractionEnabled = true
        view.delegate = self
        view.backgroundColor = .white
        return view
    }()
    
    required init() {
        super.init(frame: .zero)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
        private func setupUI() {
            addSubview(stackView)
            addSubview(convertTextField)
//            self.backgroundColor = .clear
            iconView.anchorSize(.init(width: 40, height: 40))
            stackView.anchor(top: topAnchor,
                             leading: leadingAnchor,
                             bottom: bottomAnchor, trailing: convertTextField.leadingAnchor,
                             padding: .init(top: 0, leading: 8, bottom: 0, trailing: -8), size: .init(width: 0, height: 60))
            
            convertTextField.anchor(top: topAnchor,
                                    leading: stackView.trailingAnchor,
                             bottom: bottomAnchor, trailing: trailingAnchor,
                                    padding: .init(top: 4, bottom: -4, trailing: -8), size: .init(width: 60, height: 60))
        }
    }

extension ConverterUiView: TextFieldViewDelegate, UITextFieldDelegate {
    func textFieldViewDidBeginEditing(_ textFieldView: TextFieldView) {
    }
    func textFieldViewDidEndEditing(_ textFieldView: TextFieldView) {
    }
    func textFieldViewChangedEditing(_ textFieldView: TextFieldView) {
    }
}
