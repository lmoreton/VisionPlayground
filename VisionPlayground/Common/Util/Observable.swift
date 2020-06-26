//
//  Observable.swift
//  VisionPlayground
//
//  Created by Lucas Moreton on 26/06/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import Foundation

class Observable<T> {
    
    init(_ value: T) {
        self.value = value
    }
    
    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.valueChanged?(self.value)
            }
        }
    }
    
    var valueChanged: ((T) -> Void)?
    
}
