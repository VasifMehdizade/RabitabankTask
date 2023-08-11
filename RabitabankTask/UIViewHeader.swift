//
//  UIViewHeader.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import UIKit

class UiViewHeader: UIView {

    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Valyuta məzənnəsi"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Məbləğ"
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
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
        addSubview(firstLabel)
        addSubview(secondLabel)
        
        firstLabel.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          padding: .init(top: 0,leading: 0), size: .init( width: 0, height: 40))
        
        secondLabel.anchor(top: topAnchor,
                          trailing: trailingAnchor,
                          padding: .init(top: 0,trailing: -20), size: .init( width: 0, height: 40))
    }
}
