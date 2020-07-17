//
//  HomeCoordinator.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 20/05/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

protocol HomeCoordinatorProtocol: class {
    func showOCR()
}

class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var viewModel: HomeViewModelProtocol?
    
    func start() {
        let viewModel = HomeViewModel(coordinator: self)
        let homeViewController = HomeViewController(viewModel: viewModel)
        viewModel.view = homeViewController
        self.viewModel = viewModel
        
        navigationController.viewControllers = [ homeViewController ]
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func showOCR() {
        let ocrCoordinator = OCRCoordinator(navigationController: navigationController)
        ocrCoordinator.delegate = self
        childCoordinators.append(ocrCoordinator)
        ocrCoordinator.start()
    }
}

extension HomeCoordinator: OCRCoordinatorDelegate {
    func ocrCoordinatorUserDidTapSaveItem(_ coordinator: OCRCoordinator, item: Item) {
        self.viewModel?.addItem(item)
        childCoordinators.remove(coordinator)
    }
}
