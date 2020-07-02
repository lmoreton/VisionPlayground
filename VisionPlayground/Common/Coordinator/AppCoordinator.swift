//
//  AppCoordinator.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 20/05/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        configure(navigationController: navigationController)
        
        homeCoordinator.start()
        childCoordinators.append(homeCoordinator)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    private func configure(navigationController: UINavigationController) {
            Appearance.configure(navigationController.navigationBar)
        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(addTapped))
        barButtonItem.tintColor = .systemIndigo
        navigationController.visibleViewController?.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func addTapped() {
//        let ocrViewController = OCRViewController()
        let ocrViewController = UIViewController()
        
        navigationController.present(ocrViewController, animated: true)
    }
}
