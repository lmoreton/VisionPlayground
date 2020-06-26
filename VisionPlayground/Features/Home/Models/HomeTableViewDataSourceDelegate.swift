//
//  HomeTableViewDataSourceDelegate.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 25/06/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

class HomeTableViewDataSourceDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {

    var viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol) {
//        let item = Item(confidence: "0.9", image: "maquina", text: "MAQUINA")
//        let pikachuItem = Item(confidence: "0.6", image: "pikachu", text: "PIKA PIKA DLÇ")
//        self.items = [ item, pikachuItem, item, pikachuItem ]
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items?.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as? HomeTableViewCell else { fatalError(HomeTableViewCell.reuseIdentifier) }
        
        if let item = self.viewModel.items?.value[indexPath.row] {
            cell.configure(configuration: item)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.viewModel.items?.value.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
