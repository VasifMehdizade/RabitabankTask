//
//  CustomCollectionViewCell.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    lazy var flagView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
        layer.cornerRadius = 15.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
    }
    
    // MARK: - Private
    
    private func setupUI() {
        self.backgroundColor = .clear
        addSubview(flagView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        flagView.anchor(top: topAnchor,
                         leading: leadingAnchor,
                        padding: .init(top: 10, leading: 8), size: .init(width: 40, height: 40))

        titleLabel.anchor(top: flagView.bottomAnchor,
                          leading: leadingAnchor,
                          trailing: trailingAnchor,
                          padding: .init(top: 18, leading: 8, bottom: -4, trailing: -8))
        
        subtitleLabel.anchor(top: titleLabel.bottomAnchor,
                             leading: titleLabel.leadingAnchor,
                         trailing: trailingAnchor,
                         padding: .init(top: 4, trailing: -8))
    }
}

