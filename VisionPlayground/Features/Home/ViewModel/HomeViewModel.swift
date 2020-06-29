//
//  HomeViewModel.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 25/06/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol {
    var items: Observable<[Item]>? {get set}
    func retrieveAllItems() -> [Item]
    func addItem(_ item: Item)
    func deleteItem(_ itemIndex: Int)
}

class HomeViewModel: HomeViewModelProtocol {
    var homeDataFetcher: HomeDataFetcher
    var items: Observable<[Item]>?
    weak var view: HomeViewProtocol?
    weak var coordinator: HomeCoordinatorProtocol?
    
    init(homeDataFetcher: HomeDataFetcher = HomeDataFetcher(), coordinator: HomeCoordinatorProtocol?) {
        self.coordinator = coordinator
        self.homeDataFetcher = homeDataFetcher
    }
    
    func retrieveAllItems() -> [Item] {
        items = Observable(homeDataFetcher.items())
        items?.valueChanged = { value in
            self.view?.reloadDataSource()
            print(value)
        }
        return homeDataFetcher.items()
    }
    
    func addItem(_ item: Item) {
        
        self.items?.value.append(contentsOf: [item])

    }
    
    func deleteItem(_ itemIndex: Int) {
        
        self.items?.value.remove(at: itemIndex)
        
    }
    
}
