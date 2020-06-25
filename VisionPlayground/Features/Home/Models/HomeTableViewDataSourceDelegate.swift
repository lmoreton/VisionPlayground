//
//  HomeTableViewDataSourceDelegate.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 25/06/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

class HomeTableViewDataSourceDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    var items: [Item] = [Item]()
    
    init(items: [Item]) {
//        let item = Item(confidence: "0.9", image: "maquina", text: "MAQUINA")
//        let pikachuItem = Item(confidence: "0.6", image: "pikachu", text: "PIKA PIKA DLÇ")
//        self.items = [ item, pikachuItem, item, pikachuItem ]
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as? HomeTableViewCell else { fatalError(HomeTableViewCell.reuseIdentifier) }
        cell.configure(configuration: items[indexPath.row])
        
        return cell
    }
}
