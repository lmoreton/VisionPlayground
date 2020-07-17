//
//  OCRCoordinator.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 02/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

protocol OCRCoordinatorDelegate: class {
    func ocrCoordinatorUserDidTapSaveItem(_ coordinator: OCRCoordinator, item: Item)
}

protocol OCRCoordinatorProtocol: class {
    func showScan()//VNDocumentCameraViewController
    func saveItem(_ item: Item)
}

class OCRCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    weak var delegate: OCRCoordinatorDelegate?
    
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
    
    func saveItem(_ item: Item) {
        delegate?.ocrCoordinatorUserDidTapSaveItem(self, item: item)
    }
}
