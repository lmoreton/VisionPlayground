//
//  UITableViewCell+Ext.swift
//  VisionPlayground
//
//  Created by Mateus de Campos on 20/05/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
