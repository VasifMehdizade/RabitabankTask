//
//  ConverterTableViewCell.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import UIKit

class ConverterTableViewCell: UITableViewCell {
    
    lazy var iconView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFit
        return image
    }()

    lazy var converterMoneyName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var converterMoneyDescription: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var moneyAmount: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [converterMoneyName, converterMoneyDescription])
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupUI() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.separatorInset = .init(top: 0, left: 64, bottom: 0, right: 24)
        addSubview(stackView)
        addSubview(moneyAmount)
        iconView.anchorSize(.init(width: 40, height: 40))
        stackView.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         bottom: bottomAnchor, trailing: moneyAmount.leadingAnchor,
                         padding: .init(top: 0, leading: 8, bottom: 0, trailing: -8), size: .init(width: 0, height: 60))
        
        moneyAmount.anchor(top: topAnchor,
                                leading: stackView.trailingAnchor,
                         bottom: bottomAnchor, trailing: trailingAnchor,
                                padding: .init(top: 4, bottom: -4, trailing: -8), size: .init(width: 60, height: 60))
    }
}
