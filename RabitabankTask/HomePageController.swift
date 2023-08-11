//
//  HomePageController.swift
//  RabitabankTask
//
//  Created by Vasif Mehdi on 11.08.23.
//

import UIKit

class HomePageController: BaseVC {
    
    let viewModel = ViewModel()
    
    var instance = LoginController()
    
    var name = ""
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    lazy var HeadView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Xoş Gəlmişsiniz, \(name)"
        (instance.sendNameCallBack) = { item in
            self.name = item
        }
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    lazy var logoutButton: CustomButtonView = {
        let button = CustomButtonView()
        button.backgroundColor = .systemBlue
        button.setTitleColor(.black, for: .normal)
        button.title = "Log out"
        button.click = { [weak self] in
            guard let self = self else {return}
            self.logoutButtonClicked()
        }
        return button
    }()
    
    override func setupView() {
        super.setupView()
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        view.addSubview(collectionView)
        view.addSubview(HeadView)
        HeadView.addSubview(titleLabel)
        view.addSubview(logoutButton)
        setupViewModel()
    }
    
    func showMessageActionSheet(alertMessage: String,completion: @escaping ()->()) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: alertMessage,
                                      style: .default,
                                      handler: { _ in
            completion()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .default,
                                      handler: nil))
        
        present(alert, animated: true, completion: nil)
    }

    
    fileprivate func setupViewModel() {
        viewModel.jsonSetup()
        collectionView.reloadData()
    }
    
    override func setupAnchors() {
        super.setupAnchors()
        HeadView.anchor(top: view.topAnchor,
                        leading: view.leadingAnchor,
                        trailing: view.trailingAnchor,
                        padding: .init(top: 60,leading: 0,trailing: 0), size: .init( width: 0, height: 120))
        
        titleLabel.centerInSuperview()
        
        collectionView.anchor(top: HeadView.bottomAnchor,
                              leading: view.leadingAnchor,
                              trailing: view.trailingAnchor,
                              padding: .init(top: 20, left: 12, bottom: 12, right: -12), size: .init(width: 0, height: 300))
        
        logoutButton.anchorSize(.init(width: 0, height: 56))
        logoutButton.anchor(leading: view.leadingAnchor,
                            bottom: view.layoutMarginsGuide.bottomAnchor,
                            trailing: view.trailingAnchor,
                            padding: .init(leading: 24,bottom: 0,trailing: -24))
        
    }
    
    @objc func logoutButtonClicked() {
        UserDefaults.standard.set(false, forKey: "LogOut")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.login()
    }
    
}

extension HomePageController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.homePageModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.titleLabel.text = viewModel.homePageModel[indexPath.item].title
        cell.subtitleLabel.text = viewModel.homePageModel[indexPath.item].subtitle
        cell.backgroundColor = UIColor(red: 230, green: 250/255, blue: 255, alpha: 1)
        cell.flagView.backgroundColor = .red
//        let swiftColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 - 30, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 8, bottom: 20, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0{
            
            let currencyController = NewControl()
            let nav = UINavigationController(rootViewController: currencyController)
            
            nav.modalPresentationStyle = .pageSheet
            
            if let sheet = nav.sheetPresentationController {
                
                sheet.detents = [.medium(), .large()]
                
            }
            present(nav, animated: true, completion: nil)
            
        }
        
        if indexPath.row == 1 {
            let newViewController = ConverterViewController()
            self.present(newViewController, animated:true, completion:nil)
        }
        
        if indexPath.row == 2 {
            showMessageActionSheet(alertMessage: "Call 133") {
            }
            }
        }
    }
