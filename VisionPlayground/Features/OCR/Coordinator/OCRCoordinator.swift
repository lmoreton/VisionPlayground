//
//  OCRCoordinator.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 02/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

protocol OCRCoordinatorProtocol: class {
    func showScan()//VNDocumentCameraViewController
}

class OCRCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        let viewModel = OCRViewModel(coordinator: self)
        let ocrViewController = OCRViewController(viewModel: viewModel)
        
        navigationController.present(ocrViewController, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension OCRCoordinator: OCRCoordinatorProtocol {
    func showScan() {
        print("showScan")
    }
}
