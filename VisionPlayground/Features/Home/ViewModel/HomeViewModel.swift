//
//  HomeViewModel.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 25/06/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

class HomeViewModel {
    var homeDataFetcher: HomeDataFetcher
    
    init(homeDataFetcher: HomeDataFetcher) {
        self.homeDataFetcher = homeDataFetcher
    }
}
