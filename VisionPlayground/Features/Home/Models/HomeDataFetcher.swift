//
//  HomeDataFetcher.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 25/06/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

class HomeDataFetcher {
    func items() -> [Item] {
        let item = Item(confidence: "0.9", image: "maquina", text: "MAQUINA")
        let pikachuItem = Item(confidence: "0.6", image: "pikachu", text: "PIKA PIKA DLÇ")
        let items = [ item, pikachuItem, item, pikachuItem ]
        
        return items
    }
}
