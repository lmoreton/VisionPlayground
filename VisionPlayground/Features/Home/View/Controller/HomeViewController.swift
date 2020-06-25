//
//  HomeViewController.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 20/05/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        
        return tableView
    }()
    var homeTableViewDataSourceDelegate: HomeTableViewDataSourceDelegate?
    var viewModel: HomeViewModel?
    
    convenience init(viewModel: HomeViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewConfiguration()
        title = "SHREK"
    }
    
    func registerCells() {
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
    }
}

extension HomeViewController: ViewCoding {
    func buildViewHierarchy() {
        self.view.addSubview(tableView)
    }
    
    func configureViews() {
        registerCells()
        
        homeTableViewDataSourceDelegate = HomeTableViewDataSourceDelegate(items: viewModel?.homeDataFetcher.items() ?? [])
        tableView.delegate = homeTableViewDataSourceDelegate
        tableView.dataSource = homeTableViewDataSourceDelegate
    }
    
    func setupConstraints() {
        tableView.constraint { view in
            return [
                view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            ]
        }
    }
}
