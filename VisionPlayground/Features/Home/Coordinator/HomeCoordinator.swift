//
//  HomeCoordinator.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 20/05/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        let homeViewController = HomeViewController()

        navigationController.viewControllers = [ homeViewController ]
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
