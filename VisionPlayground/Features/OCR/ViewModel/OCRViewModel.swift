//
//  OCRViewModel.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 15/07/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

protocol OCRViewModelProtocol {
    func saveNewItem()
    func scanDocument()
}

class OCRViewModel: OCRViewModelProtocol {
    var coordinator: OCRCoordinatorProtocol?
    
    init(coordinator: OCRCoordinatorProtocol?) {
        self.coordinator = coordinator
    }
    
    func saveNewItem() {
        coordinator?.saveItem(Item(confidence: "0.9", image: "pikachu", text: "XABLAU"))
    }
    
    func scanDocument() {
        print("scanDocument")
    }
}
