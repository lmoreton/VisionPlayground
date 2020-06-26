//
//  HomeCoordinator.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 20/05/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

protocol HomeCoordinatorProtocol: class {
    func showForm()
}

class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        let viewModel = HomeViewModel(coordinator: self)
        let homeViewController = HomeViewController(viewModel: viewModel)
        viewModel.view = homeViewController

        navigationController.viewControllers = [ homeViewController ]
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func showForm() {
        
    }
}
