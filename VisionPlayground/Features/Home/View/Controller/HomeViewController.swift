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
    var viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewConfiguration()
        title = "SHREK"
        
        configure(navigationController: self.navigationController!)
        _ = viewModel.retrieveAllItems()
    }
    
    private func configure(navigationController: UINavigationController) {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(addTapped))
        barButtonItem.tintColor = .systemIndigo
        navigationController.visibleViewController?.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func addTapped() {
        viewModel.addItem(Item(confidence: "0.9", image: "pikachu", text: "XABLAU"))
        print("oi")
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
        
        homeTableViewDataSourceDelegate = HomeTableViewDataSourceDelegate(viewModel: self.viewModel)
        tableView.delegate = homeTableViewDataSourceDelegate
        tableView.dataSource = homeTableViewDataSourceDelegate
    }
    
    func setupConstraints() {
        tableView.constraint { view in
            return [
                view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            ]
        }
    }
}

extension HomeViewController: HomeViewProtocol {
    func reloadDataSource() {
        tableView.reloadData()
    }
}
