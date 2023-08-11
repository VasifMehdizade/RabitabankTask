//
//  CurrencyTableViewCell.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    lazy var flagView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var moneyName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var alishLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var satishLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var flagStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [flagView, moneyName])
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 8
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
        flagView.anchorSize(.init(width: 40, height: 40))
        addSubview(flagStackView)
        addSubview(alishLabel)
        addSubview(satishLabel)
        flagStackView.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         bottom: bottomAnchor, trailing: trailingAnchor,
                         padding: .init(top: 4, leading: 8, bottom: -4, trailing: -8))
        
        alishLabel.anchor(top: topAnchor,
                          padding: .init(top: 14), size: .init( width: 0, height: 12))
        alishLabel.centerXToSuperview()
        
        satishLabel.anchor(top: topAnchor,
                          trailing: trailingAnchor,
                          padding: .init(top: 14,trailing: -12), size: .init( width: 0, height: 12))
    }
}
