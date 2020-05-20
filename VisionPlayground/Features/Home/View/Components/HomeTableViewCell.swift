//
//  HomeTableViewCell.swift
//  VisionPlayground
//
//  Created by Mateus de Campos on 20/05/20.
//  Copyright © 2020 Lucas Moreton. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    lazy var confidenceLabel: UILabel = {
        let lbl: UILabel = UILabel()
        lbl.textColor = .systemBlue
        return lbl
    }()
    
    lazy var contentLabel: UILabel = {
        let lbl: UILabel = UILabel()
        lbl.textColor = .label
        return lbl
    }()
    
    lazy var itemImageView: UIImageView = {
        let img: UIImageView = UIImageView()
        img.contentMode = .scaleAspectFit
        img.layer.cornerRadius = 8
        img.layer.masksToBounds = true
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViewConfiguration()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension HomeTableViewCell {
    
    func configure(configuration: Item) {
        
    }
    
}

extension HomeTableViewCell: ViewCoding {
    
    func buildViewHierarchy() {
        self.contentView.addSubview(confidenceLabel)
        self.contentView.addSubview(contentLabel)
        self.contentView.addSubview(itemImageView)
    }
    
    func setupConstraints() {
        
        itemImageView.constraint { view in
            [
                view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
            ]
        }
        
    }
    
}
