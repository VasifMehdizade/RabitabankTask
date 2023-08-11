//
//  ConversionController.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import UIKit

class ConverterViewController: BaseVC {
    
    var viewModel = ConversionViewModel()
    
    lazy var navigation: NavigationBarView = {
        let nav = NavigationBarView()
        nav.backgroundColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 0.3)
        nav.layer.borderWidth = 0.4
        return nav
    }()

    lazy var segmentedController: UISegmentedControl = {
        let segmentItems = ["Alış", "Satış"]
        let control = UISegmentedControl(items: segmentItems)
        control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        control.selectedSegmentIndex = 0
        return control
    }()
    
    lazy var konvertasiyaLabel: UILabel = {
        let label = UILabel()
        label.text = "Konvertasiya"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var headerView: UiViewHeader = {
        let view = UiViewHeader()
        return view
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
        view.addSubview(navigation)
        view.addSubview(segmentedController)
        view.addSubview(konvertasiyaLabel)
        view.addSubview(headerView)
        view.addSubview(tableView)
        setupViewModel()
        tableView.register(ConverterTableViewCell.self, forCellReuseIdentifier: "ConverterTableViewCell")

    }
    
    fileprivate func setupViewModel() {
        viewModel.jsonSetup()
        viewModel.SalesJsonSetup()
        tableView.reloadData()
    }
    
    override func setupAnchors() {
        super.setupAnchors()
        
        navigation.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,
                          padding: .init(top: 0, leading: 0, trailing: 0), size: .init(width: 0, height: 84))
        
        segmentedController.anchor(top: view.topAnchor,
                                   padding: .init(top: 20), size: .init( width: 200, height: 40))
        segmentedController.centerXToSuperview()
        
        konvertasiyaLabel.anchor(top: navigation.bottomAnchor, leading: view.leadingAnchor, padding: .init(top: 12, leading: 24), size: .init(width: 0, height: 30))
        
        headerView.anchor(top: konvertasiyaLabel.bottomAnchor, leading: konvertasiyaLabel.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 12, trailing: -12), size: .init(width: 0, height: 40))
        
        tableView.anchor(top: headerView.bottomAnchor, leading: view.leadingAnchor, trailing: headerView.trailingAnchor, padding: .init(top: 4, leading: 12, trailing: 0), size: .init(width: 0, height: 310))
    }

}

extension ConverterViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.conversionModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConverterTableViewCell", for: indexPath) as! ConverterTableViewCell
        cell.moneyAmount.text = viewModel.conversionModel[indexPath.item].amount
        cell.converterMoneyName.text = viewModel.conversionModel[indexPath.item].name
        cell.converterMoneyDescription.text = viewModel.conversionModel[indexPath.item].description
        cell.iconView.image = UIImage(named: "\(viewModel.conversionModel[indexPath.item].icon)")
        return cell
    }
}
