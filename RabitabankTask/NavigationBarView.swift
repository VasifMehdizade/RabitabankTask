//
//  NavigationBarView.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import UIKit

class NavigationBarView: UIView {
    
    final class NavigationBarView: UIView {
        
        lazy var contentView: UIView = {
            let view = UIView()
            return view
        }()
        
        private lazy var backButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "back_icon"), for: .normal)
            button.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
            return button
        }()
        
        lazy var segmentedController: UISegmentedControl = {
            let segmentItems = ["Alış", "Satış"]
            let control = UISegmentedControl(items: segmentItems)
            control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
            control.selectedSegmentIndex = 1
            return control
        }()
        
        @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
            switch (segmentedControl.selectedSegmentIndex) {
            case 0:
                // First segment tapped
                break
            case 1:
                // Second segment tapped
                break
            default:
                break
            }
        }
        
        required init() {
            super.init(frame: .zero)
            
            self.setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Private
        
        private func setupUI() {
            addSubview(contentView)
            contentView.fillSuperview()
            contentView.addSubview(backButton)
            backButton.anchor(bottom: contentView.bottomAnchor, trailing: contentView.leadingAnchor,
                              padding: .init(bottom: -12, trailing: -12), size: .init(width: 24, height: 24))
            contentView.addSubview(segmentedController)
            
            segmentedController.anchor(top: topAnchor,
                                       padding: .init(top: 20), size: .init( width: 200, height: 40))
            segmentedController.centerXToSuperview()

        }
        
        //     MARK: - Action
        
        @objc func backButtonClicked() {
//            let nav = UIApplication.getPresentedViewController() as! BaseNC
//            nav.popViewController(animated: true)
//            presentingViewController.dismissViewControllerAnimated(true, completion: nil)

        }
    }
}

