//
//  CustomButtonView.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import UIKit

class CustomButtonView: UIButton {
        
        var click: (() -> ())?
        
        var title: String? {
            didSet {
                textLabel.text = title
            }
        }
        
        lazy var buttonView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 6
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.black.cgColor
            return view
        }()
        
        lazy var textLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 16, weight: .semibold)
            label.isUserInteractionEnabled = false
            return label
        }()
        
        required init() {
            super.init(frame: .zero)
            self.setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupUI() {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(touchUpInside))
            buttonView.addGestureRecognizer(gesture)
            addSubview(buttonView)
            
            buttonView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor ,trailing: trailingAnchor,
                              padding: .init(top: 0, left: 0, bottom: 0, right: 0))
            
            buttonView.addSubview(textLabel)
            
            textLabel.anchor(top: buttonView.topAnchor, leading: buttonView.leadingAnchor, bottom: buttonView.bottomAnchor ,trailing: buttonView.trailingAnchor,
            padding: .init(top: 12, left: 12, bottom: -12, right: -12))
        }
        
        @objc func touchUpInside() {
            self.click?()
        }
    }
