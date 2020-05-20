//
//  ViewCoding.swift
//  VisionPlayground
//
//  Created by Mateus de Campos on 20/05/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol ViewCoding: class {
    
    func setupViewConfiguration()
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCoding {
    
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() {}
}
