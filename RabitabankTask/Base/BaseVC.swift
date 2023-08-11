//
//  BaseVC.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        setupView()
        setupLabels()
        setupAnchors()
    }
    // MARK: - Initialization Functions
    func setupView() {}
    func setupLabels() {}
    func setupAnchors() {}
}

extension BaseVC: UIGestureRecognizerDelegate {}
