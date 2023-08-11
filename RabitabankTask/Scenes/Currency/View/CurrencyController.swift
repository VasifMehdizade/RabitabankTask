//
//  CurrencyController.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import Foundation
import UIKit

class NewControl: BaseVC {
    
    let viewModel = CurrencyViewModel()
    
    func addControl() {
        let segmentItems = ["Nağdsız", "Nağd"]
        let control = UISegmentedControl(items: segmentItems)
        control.frame = CGRect(x: 10, y: 40, width: (self.view.frame.width - 20), height: 40)
        control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        control.selectedSegmentIndex = 0
        view.addSubview(control)
    }
    
    lazy var HeadView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Məzənnə"
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Alış"
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var thirdLabel: UILabel = {
        let label = UILabel()
        label.text = "Satış"
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            viewModel.jsonSetup()
            tableView.reloadData()
            break
        case 1:
            viewModel.SalesJsonSetup()
            tableView.reloadData()
            break
        default:
            break
        }
    }
    
    override func setupView() {
        super.setupView()
        view.backgroundColor = .white
        addControl()
        view.addSubview(HeadView)
        HeadView.addSubview(firstLabel)
        HeadView.addSubview(secondLabel)
        HeadView.addSubview(thirdLabel)
        setupViewModel()
        tableView.register(CurrencyTableViewCell.self, forCellReuseIdentifier: "CurrencyTableViewCell")

    }
    
    fileprivate func setupViewModel() {
        viewModel.jsonSetup()
        viewModel.SalesJsonSetup()
        tableView.reloadData()
    }
    
    override func setupAnchors() {
        super.setupAnchors()
        //        segmentedController.anchor(top: view.topAnchor,
        //                                   leading: view.leadingAnchor,
        //                                   trailing: view.trailingAnchor,
        //                                   padding: .init(top: 20,leading: 12,trailing: -12), size: .init( width: 0, height: 40))
        
        HeadView.anchor(top: view.topAnchor,
                                   leading: view.leadingAnchor,
                                   trailing: view.trailingAnchor,
                                   padding: .init(top: 84,leading: 12,trailing: -12), size: .init( width: 0, height: 40))
        
        firstLabel.anchor(top: HeadView.topAnchor,
                          leading: HeadView.leadingAnchor,
                          padding: .init(top: 14,leading: 12), size: .init( width: 0, height: 12))
        
        secondLabel.anchor(top: HeadView.topAnchor,
                          padding: .init(top: 14), size: .init( width: 0, height: 12))
        secondLabel.centerXToSuperview()
        
        thirdLabel.anchor(top: HeadView.topAnchor,
                          trailing: HeadView.trailingAnchor,
                          padding: .init(top: 14,trailing: -12), size: .init( width: 0, height: 12))
        
        view.addSubview(tableView)
        tableView.anchor(top: HeadView.bottomAnchor,
                                   leading: view.leadingAnchor,
                                   trailing: view.trailingAnchor,
                                   padding: .init(top: 12,leading: 12,trailing: -12), size: .init( width: 0, height: 150))
    }
    
    
}

extension NewControl: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.currencyModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell", for: indexPath) as! CurrencyTableViewCell
        cell.moneyName.text = viewModel.currencyModel[indexPath.row].name
        cell.alishLabel.text = viewModel.currencyModel[indexPath.row].alish
        cell.satishLabel.text = viewModel.currencyModel[indexPath.row].satish
        cell.flagView.image = UIImage(named: "\(viewModel.currencyModel[indexPath.row].icon)")
        return cell
    }
}

