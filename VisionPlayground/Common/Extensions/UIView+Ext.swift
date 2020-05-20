//
//  UIView+Ext.swift
//  VisionPlayground
//
//  Created by Mateus de Campos on 20/05/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

public extension UIView {
    func constraint(_ closure: (UIView) -> [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        return NSLayoutConstraint.activate(closure(self))
    }
}
