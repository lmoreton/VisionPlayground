//
//  Coordinator.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 20/05/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}
